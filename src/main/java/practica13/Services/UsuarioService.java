package practica13.Services;

import practica13.Models.Usuario;
import java.util.List;


public interface UsuarioService{

    Usuario crearUsuario(Usuario usuario);
    void actualizarUsuario(Usuario usuario);
    void borrarUsuarioPorId(long id);
    void borrarTodosLosUsuarios();
    List<Usuario> buscarTodosUsuarios();
    Usuario buscarPorId(long id);
    Usuario findByUsername(String username);
    boolean usuarioExiste(Usuario usuario);

}
