package cat.xtec.ioc.repository;

import java.util.List;

import cat.xtec.ioc.domain.Llibre;

public interface LlibreRepository {
    
    // Mètode per obtenir tots els llibres
    List<Llibre> getAllLlibres();

}
