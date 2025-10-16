
package cat.xtec.ioc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cat.xtec.ioc.service.LlibreService;

/**
 *
 * @author equip totEsBook
 */

@Controller
public class LlibreController {

    @Autowired
    private LlibreService llibreService;

    // mapping relatiu a l'arrel de l'aplicació: /TotEsBook/mostrarLlibres
    @RequestMapping("/mostrarLlibres")
    public ModelAndView pagina2() {
        ModelAndView modelview = new ModelAndView("mostrarLlibres");
        
        //System.out.println("Hola Josep");

        modelview.addObject("llibres", llibreService.getAllLlibres());
        return modelview;
    }
}
