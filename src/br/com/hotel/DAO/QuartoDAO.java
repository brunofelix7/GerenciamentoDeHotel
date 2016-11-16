package br.com.hotel.DAO;

import javax.persistence.EntityManager;

import br.com.hotel.Entity.Quarto;

/**
 * @author Bruno Felix
 */
public class QuartoDAO extends AbstractDAO<Quarto>{
    
    public QuartoDAO(EntityManager entityManager){
        super(entityManager);
    }
    
    @Override
    protected Class<Quarto> entityClass(){
        return Quarto.class;
    }
    
}
