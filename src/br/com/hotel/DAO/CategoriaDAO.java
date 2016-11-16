package br.com.hotel.DAO;

import javax.persistence.EntityManager;

import br.com.hotel.Entity.Categoria;

/**
 * @author Bruno Felix
 */
public class CategoriaDAO extends AbstractDAO<Categoria>{

    public CategoriaDAO(EntityManager entityManager){
        super(entityManager);
    }
    
    @Override
    protected Class<Categoria> entityClass(){
        return Categoria.class;
    }
    
}
