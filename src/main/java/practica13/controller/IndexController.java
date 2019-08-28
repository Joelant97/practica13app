package practica13.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import practica13.Models.Encuesta;
import practica13.Models.Rol;
import practica13.Models.Usuario;
import practica13.Services.EncuestaService;
import practica13.Services.RolServiceImpl;
import practica13.Services.UsuarioService;

import javax.servlet.http.HttpServletRequest;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

@Controller
public class IndexController {

    @Autowired
    private UsuarioService usuarioService;

    @Autowired
    private EncuestaService encuestaService;
    @Autowired
    private RolServiceImpl rolService;

    @Autowired
    private MessageSource messageSource;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model, Locale locale, HttpServletRequest request)
    {
        List<Encuesta> encuestas = encuestaService.listarEncuestas();
        model.addAttribute("encuestas",encuestas);
        model.addAttribute("puerto", ""+request.getLocalPort());
        //  model.addAttribute("saludo", messageSource.getMessage("saludo", null, locale));

        // model.addAttribute("derecho_autor", messageSource.getMessage("derecho_autor", null, locale));
        return "index";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginGET(Model model) {

        if(usuarioService.listarUsuarios().size() == 0) {
            Set<Rol> roles = new HashSet<>();
            Rol rol = new Rol();
            rol.setNombreRol("ADMIN");
            rolService.crearRol(rol);
            Rol rol2 = new Rol();
            rol2.setNombreRol("Vendedor");
            rolService.crearRol(rol2);
            usuarioService.crearUsuario(new Usuario(1, "admin", "admin", "admin@gmail.com", rol));
        }
        return "login";
    }


    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String loginPOST(
            @RequestParam(value = "username", required = false) String username,
            @RequestParam(value = "password", required = false) String password
    ) {
        usuarioService.login(username, password);

        return "redirect:/";
    }


}
