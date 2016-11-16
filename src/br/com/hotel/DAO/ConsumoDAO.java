package br.com.hotel.DAO;

import javax.persistence.EntityManager;

import br.com.hotel.Entity.Consumo;

/**
 * @author Bruno Felix
 */
public class ConsumoDAO extends AbstractDAO<Consumo>{
    
    public ConsumoDAO(EntityManager entityManager){
        super(entityManager);
    }
    
    @Override
    protected Class<Consumo> entityClass() {
        return Consumo.class;
    }
    
}
