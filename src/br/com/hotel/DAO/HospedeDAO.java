package br.com.hotel.DAO;

import javax.persistence.EntityManager;
import br.com.hotel.Entity.Hospede;

/** 
 * @author Bruno Felix
 */
public class HospedeDAO extends AbstractDAO<Hospede>{
	
	public HospedeDAO(EntityManager entityManager) {
        super(entityManager);
    }
    
    @Override
    protected Class<Hospede> entityClass() {
        return Hospede.class;
    }

}
