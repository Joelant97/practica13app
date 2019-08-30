package practica13.Services;

public interface SecurityService {

    String usuarioLogueado();

    void autoLogin(String username, String password);
}
