package cat.totesbook.controller;
import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.ui.Model;
import cat.totesbook.service.UsuariService; 
import cat.totesbook.model.Usuari;

@Controller public class LoginController {
    @Autowired private UsuariService usuariService;
    @GetMapping("/login") public String loginForm(){ return "login"; }
    @PostMapping("/login") public String doLogin(@RequestParam String email, @RequestParam String contrasenya, HttpSession session, Model model){
        Usuari u = usuariService.findByEmail(email).orElse(null);
        if(u==null){ model.addAttribute("error","Usuari no trobat"); return "login"; }
        if(!u.getContrasenya().equals(contrasenya)){ model.addAttribute("error","Credencials incorrectes"); return "login"; }
        session.setAttribute("user", u);
        if("ADMIN".equals(u.getRol())) return "redirect:/views/admin/dashboard.jsp";
        if("BIBLIOTECARI".equals(u.getRol())) return "redirect:/views/bibliotecari/llibres.jsp";
        return "redirect:/views/usuari/cataleg.jsp";
    }
    @GetMapping("/logout") public String logout(HttpSession s){ s.invalidate(); return "redirect:/login"; }
}