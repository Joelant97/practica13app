package practica13.Repositories;

import practica13.Models.Rol;
import org.springframework.data.jpa.repository.JpaRepository;


public interface RolRepository extends JpaRepository<Rol, Long> {

    Rol findByNombreRol(String rol);

}
