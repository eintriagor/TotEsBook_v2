package cat.xtec.ioc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cat.xtec.ioc.domain.Llibre;
import cat.xtec.ioc.repository.impl.LlibreDAO;
import cat.xtec.ioc.service.LlibreService;

@Service
public class LlibreServiceImpl implements LlibreService {
    
    @Autowired
    private LlibreDAO llibreDao;

    @Override
    public List<Llibre> getAllLlibres() {
        return llibreDao.getAllLlibres();
    }
}
