
package cat.xtec.ioc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author jmiro
 */

@Controller
@RequestMapping("/TotEsBook")   // Inclou /TotEsBook a les URL

public class BooksController {

    @GetMapping("/mostrarLlibres")
    public ModelAndView pagina2() {
        ModelAndView modelview = new ModelAndView("mostrarLlibres");
        
        System.out.println("Hola");
        modelview.addObject("mostrar", "El señor de los anillos!"); // dades que podràs mostrar a la JSP

        return modelview;
    }
}
