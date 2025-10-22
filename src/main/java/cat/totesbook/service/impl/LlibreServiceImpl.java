package cat.totesbook.service.impl;

import cat.totesbook.repository.LlibreRepository;
import cat.totesbook.service.LlibreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import cat.totesbook.domain.Llibre;

@Service
public class LlibreServiceImpl implements LlibreService {

    @Autowired
    private LlibreRepository llibreRepository;

    @Override
    public List<Llibre> getAllLlibres() {
        return llibreRepository.getAllLlibres();
    }

    @Override
    @Transactional
    public void guardarLlibre(Llibre llibre) {
        llibreRepository.addLlibre(llibre);
    }
    
   
    @Override
    public Optional<Llibre> getLlibreByIsbn(String isbn){
        return llibreRepository.getLlibreByIsbn(isbn);
    }
}
