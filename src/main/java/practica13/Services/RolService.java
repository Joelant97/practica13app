package practica13.Services;

import practica13.Models.Rol;

import java.util.List;

public interface RolService {

    Rol crearRol(Rol rol);
    void actualizarRol(Rol rol);
    void borrarRolPorId(long id);
    void borrarTodosLosRoles();
    List<Rol> buscarTodosRoles();
    Rol buscarPorId(long id);
    Rol findByNombreRol(String nombreRol);
    boolean rolExiste(Rol cliente);
}
