package cat.xtec.ioc.repository;
import java.util.List;
import cat.xtec.ioc.domain.Llibre;
import java.util.Optional;


// Interfaces de la capa repositori
public interface LlibreRepository {
    
    // Mètode per obtenir tots els llibres
    List<Llibre> getAllLlibres();
    
    // Mètode per afegir un llibre
    void addLlibre(Llibre llibre);
    
    // Comprovem si el ISBN existeix
    Optional<Llibre> getLlibreByIsbn(String isbn);

}
