package practica13.controller;

import practica13.Models.Rol;
import practica13.Models.Usuario;
import practica13.Services.RolServiceImpl;
import practica13.Services.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/usuarios")
public class UsuariosController {

    @Autowired
    private UsuarioService usuarioService;

    @Autowired
    private RolServiceImpl rolService;

    @GetMapping(value="/")
    public String usuarios(Model model)
    {
        List<Usuario> usuarios = new ArrayList<>();
        usuarios = usuarioService.listarUsuarios();
        List<Rol> roles = rolService.buscarTodosRoles();
        model.addAttribute("usuarios", usuarios);
        model.addAttribute("roles", roles);

        return "usersview";
    }

    @PostMapping("/crear/")
    public String crearUsuario(@RequestParam("username") String username, @RequestParam("password") String password, @RequestParam("email") String email, @RequestParam("rol") String rol){
        Usuario u = new Usuario();
        u.setUsername(username);
        u.setPassword(password);
        u.setEmail(email);
        u.setActive(1);
        Rol r = new Rol();
        r = rolService.findByNombreRol(rol);
        u.setRol(r);
        usuarioService.crearUsuario(u);
        return "redirect:/usuarios/";
    }

    @PostMapping("/modificar/")
    public String modificarUsuario(@RequestParam("username2") String username, @RequestParam("id2") String id,@RequestParam("password2") String password, @RequestParam("email2") String email, @RequestParam("rol2") String rol){
        Usuario u = usuarioService.encontrarUsuarioPorId(Long.parseLong(id));
        Rol r = rolService.findByNombreRol(rol);
        u.setRol(r);
        u.setUsername(username);
        u.setPassword(password);
        u.setEmail(email);

        usuarioService.actualizarUsuario(u);
        return "redirect:/usuarios/";
    }


    @GetMapping(value = "/eliminar/{id}")
    public String borrarRol(@PathVariable String id) {
        return "redirect:/usuarios/";
    }


}
