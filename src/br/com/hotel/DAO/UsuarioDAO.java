package br.com.hotel.DAO;

import javax.persistence.EntityManager;

import br.com.hotel.Entity.Usuario;

/**
 * @author Bruno Felix
 */
public class UsuarioDAO extends AbstractDAO<Usuario>{
    
    public UsuarioDAO(EntityManager entityManager) {
        super(entityManager);
    }
    
    @Override
    protected Class<Usuario> entityClass() {
        return Usuario.class;
    }
    
    
    
}
