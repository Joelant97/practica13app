package practica13.Services;

import practica13.Models.Rol;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import practica13.Repositories.RolRepository;

import javax.transaction.Transactional;
import java.util.List;

@Service("rolService")
@Transactional
public class RolServiceImpl implements RolService {

    @Autowired
    private RolRepository rolRepository;

    public Rol crearRol(Rol rol){
        return rolRepository.save(rol);
    }
    public void actualizarRol(Rol rol){
        crearRol(rol);
    }
    public void borrarRolPorId(long id){
        rolRepository.deleteById(id);
    }
    public void borrarTodosLosRoles(){
        rolRepository.deleteAll();
    }
    public List<Rol> buscarTodosRoles(){
        return rolRepository.findAll();
    }
    @Override
    public Rol buscarPorId(long id){
        return rolRepository.findById(id).get();
    }
    public Rol findByNombreRol(String nombreRol){
        return rolRepository.findByNombreRol(nombreRol);
    }
    public boolean rolExiste(Rol rol){
        return findByNombreRol(rol.getNombreRol()) != null;
    }
}
