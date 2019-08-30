package practica13.controller;


import java.util.List;
import practica13.Models.Rol;
import practica13.Services.RolService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * RolController
 */
@Controller
public class RolController {

    @Autowired
    RolService rolService;

    @RequestMapping(value = "/rol/crear", method = RequestMethod.POST, consumes = "application/json")
    public ResponseEntity<List<Rol>> crearRol(@RequestBody List<Rol> rolList) {

        for (Rol rol : rolList) {

            rolService.crearRol(rol);
        }

        return new ResponseEntity<>(rolList, HttpStatus.OK);
    }

    @ResponseBody
    @RequestMapping(value = "/roles", produces = {"application/json"})
    public List<Rol> roles() {
        return rolService.buscarTodosRoles();
    }
}