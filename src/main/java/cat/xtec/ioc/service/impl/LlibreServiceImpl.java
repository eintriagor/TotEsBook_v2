package cat.xtec.ioc.service.impl;

import cat.xtec.ioc.repository.LlibreRepository;
import cat.xtec.ioc.service.LlibreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.stereotype.Service;

import java.util.List;
import cat.xtec.ioc.domain.Llibre;
import java.util.Optional;

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
    
    public Optional getLlibreByIsbn(String isbn){
        return llibreRepository.getLlibreByIsbn(isbn);
    }
}
