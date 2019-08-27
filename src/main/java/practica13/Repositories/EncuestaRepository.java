package practica13.Repositories;

import practica13.Models.Encuesta;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EncuestaRepository extends JpaRepository<Encuesta, Long> {

    Encuesta findEncuestaById(Long id);

}
