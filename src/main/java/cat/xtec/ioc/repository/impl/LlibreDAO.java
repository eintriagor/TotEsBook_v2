package cat.xtec.ioc.repository.impl;

import java.util.List;
import org.springframework.stereotype.Repository;
import cat.xtec.ioc.domain.Llibre;
import cat.xtec.ioc.repository.LlibreRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.Optional;

@Repository
public class LlibreDAO implements LlibreRepository {

    // Creem EntityManager gestionat Spring
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Llibre> getAllLlibres() {
        return entityManager.createQuery("SELECT l FROM Llibre l", Llibre.class).getResultList();
    }

    // Afegeix un llibre a la base de dades
    @Override
    public void addLlibre(Llibre llibre) {
        entityManager.merge(llibre);
    }

    @Override
    public Optional<Llibre> getLlibreByIsbn(String isbn) {
        try {
            Llibre llibre = entityManager.find(Llibre.class, isbn);
            return Optional.ofNullable(llibre);
        } catch (Exception e) {
            return Optional.empty();
        }
    }
}
