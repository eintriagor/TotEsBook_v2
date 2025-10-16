package cat.xtec.ioc.service;

import com.fasterxml.jackson.databind.JsonNode;
import cat.xtec.ioc.domain.Llibre;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

@Service
public class GoogleBooksService {

    private final RestTemplate restTemplate;
    private final LlibreService llibreService; // Per guardar amb transacció

    public GoogleBooksService(RestTemplate restTemplate, LlibreService llibreService) {
        this.restTemplate = restTemplate;
        this.llibreService = llibreService;
    }

    // Mètode que retorna un Llibre si el troba a Google Books
    public Optional<Llibre> getLlibreByIsbn(String isbn) {
        try {
            // Netejar ISBN (Google Books funciona millor sense guions)
            String cleanIsbn = isbn.replace("-", "");

            String url = "https://www.googleapis.com/books/v1/volumes?q=isbn:" + cleanIsbn;
            JsonNode bookData = restTemplate.getForObject(url, JsonNode.class);

            if (bookData != null && bookData.has("items") && bookData.get("items").isArray()
                    && !bookData.get("items").isEmpty()) {

                JsonNode volumeInfo = bookData.get("items").get(0).get("volumeInfo");

                String titol = volumeInfo.path("title").asText("Títol desconegut");
                String editorial = volumeInfo.path("publisher").asText("Editorial desconeguda");
                String sinopsis = volumeInfo.path("description").asText("Sense sinopsis.");
                String imatgeUrl = volumeInfo.path("imageLinks").path("thumbnail").asText(null);

                String autors = "Autor desconegut";
                if (volumeInfo.has("authors")) {
                    autors = StreamSupport.stream(volumeInfo.get("authors").spliterator(), false)
                            .map(JsonNode::asText)
                            .collect(Collectors.joining(", "));
                }

                String categoria = "Sense categoria";
                if (volumeInfo.has("categories")) {
                    categoria = StreamSupport.stream(volumeInfo.get("categories").spliterator(), false)
                            .map(JsonNode::asText)
                            .findFirst().orElse("Sense categoria");
                }

                // Creem l’objecte Llibre
                return Optional.of(new Llibre(cleanIsbn, titol, autors, editorial, categoria, sinopsis, imatgeUrl));
            }

        } catch (Exception e) {
            System.err.println("Error en consultar l'API de Google Books per l'ISBN " + isbn + ": " + e.getMessage());
        }

        return Optional.empty();
    }

    // Mètode que consulta l'API i GUARDA el llibre a BD
    public void importarILlibrePerIsbn(String isbn) {
        try {
            Optional<Llibre> optLlibre = getLlibreByIsbn(isbn);
            if (optLlibre.isPresent()) {
                Llibre llibre = optLlibre.get();

                // Comprovem si ja existeix a la BD pel ISBN
                Optional<Llibre> existent = llibreService.getLlibreByIsbn(isbn);
                if (existent.isPresent()) {
                    System.out.println("Llibre amb ISBN " + isbn + " ja existeix. S'omet.");
                    return; // No fem res més per a evitar duplicats a la BD
                }

                System.out.println("Guardant llibre: " + llibre.getTitol());
                llibreService.guardarLlibre(llibre);  
            } else {
                System.out.println("No s'ha trobat llibre per ISBN " + isbn);
            }
        } catch (Exception e) {
            System.err.println("Error important llibre per ISBN " + isbn + ": " + e.getMessage());
        }
    }

}
