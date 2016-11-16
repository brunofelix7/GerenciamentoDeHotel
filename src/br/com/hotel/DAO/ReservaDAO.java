package br.com.hotel.DAO;

import javax.persistence.EntityManager;

import br.com.hotel.Entity.Reserva;

/**
 * @author Bruno Felix
 */
public class ReservaDAO extends AbstractDAO<Reserva>{
    
     public ReservaDAO(EntityManager entityManager) {
        super(entityManager);
    }
    
    @Override
    protected Class<Reserva> entityClass() {
        return Reserva.class;
    }
    
}
