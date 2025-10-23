package cat.totesbook.service;
import cat.totesbook.model.Usuari;
import java.util.Optional;

public interface UsuariService { 
    Optional<Usuari> findByEmail(String email); 
    Usuari save(Usuari u); 
}