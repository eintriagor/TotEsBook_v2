package cat.xtec.ioc.repository.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import cat.xtec.ioc.domain.Llibre;
import cat.xtec.ioc.repository.LlibreRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Repository
public class LlibreDAO implements LlibreRepository {
    // Definim el nom de la unitat de persistència (persistence unit) que volem utilitzar
    @PersistenceContext(unitName = "totesbookPersistenceUnit")
    private EntityManager entityManager;

    @Override
    public List<Llibre> getAllLlibres() {
        return entityManager.createQuery("SELECT l FROM Llibre l", Llibre.class).getResultList();
    }
}