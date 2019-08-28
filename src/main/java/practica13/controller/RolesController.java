package practica13.controller;

import practica13.Models.Rol;
import practica13.Services.RolServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/roles")
public class RolesController {

    @Autowired
    private RolServiceImpl rolService;


    @GetMapping(value="/")
    public String roles(Model model)
    {
        List<Rol> roles = new ArrayList<>();
        roles = rolService.buscarTodosRoles();
        model.addAttribute("roles", roles);
        return "roles";
    }

    @GetMapping(value="/ver/{id}")
    public String rol(Model model, @PathVariable String id)
    {
        Rol r = rolService.buscarPorId(Long.parseLong(id));
        model.addAttribute("rol", r);
        return "rol";
    }


    @PostMapping("/")
    public String crearRol(@RequestParam("nombrerol") String rol){
        Rol r = new Rol();
        r.setNombreRol(rol);
        rolService.crearRol(r);
        return "redirect:/roles/";
    }

    @PostMapping("/modificar/")
    public String modificarRol(@RequestParam("nombrerol2") String rol, @RequestParam("id2") String id){
        Rol r = rolService.buscarPorId(Long.parseLong(id));
        r.setNombreRol(rol);
        rolService.actualizarRol(r);
        return "redirect:/roles/";
    }


    @PostMapping(value = "/eliminar/{id}")
    public String borrarRol(@PathVariable String id) {
        rolService.borrarRolPorId(Long.parseLong(id));
        return "redirect:/roles/";
    }
}
