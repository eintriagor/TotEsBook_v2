package cat.totesbook.service;

import java.util.List;
import cat.totesbook.domain.Llibre;
import java.util.Optional;

// Interface de la capa de servei
public interface LlibreService {

    List<Llibre> getAllLlibres();

    void guardarLlibre(Llibre llibre);
    
    Optional<Llibre> getLlibreByIsbn(String isbn);
    
}
