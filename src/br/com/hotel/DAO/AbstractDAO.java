package br.com.hotel.DAO;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.hibernate.ejb.EntityManagerImpl;
import br.com.hotel.Entity.AbstractEntity;

/** 
 * @author Bruno Felix
 * @param <T>
 */
public abstract class AbstractDAO<T extends AbstractEntity> {
    
    protected EntityManager entityManager;
   
    protected abstract Class<T> entityClass();
    
    public Session getSession(){
    	@SuppressWarnings("unused")
		Session session = null;
    	if(entityManager.getDelegate() instanceof EntityManagerImpl){
    		EntityManagerImpl entityManagerImpl = (EntityManagerImpl) entityManager.getDelegate();
    		return entityManagerImpl.getSession();
    	}else{
    		return (Session) entityManager.getDelegate();
    	}
    }
    
    public AbstractDAO(EntityManager manager){
        this.entityManager = manager;
    }
    
    public void salvar(T entity){
        entityManager.persist(entity);
    }
    
    public void atualizar(T entity){
        entityManager.merge(entity);
    }
    
    public void remover(T entity){
        entity = entityManager.find(entityClass(), entity.getId());
        entityManager.remove(entity);
    }
    
    public T buscarPorId(Long id) {
        return entityManager.find(entityClass(), id);
    }
    
    @SuppressWarnings("unchecked")
    public List<T> listar(){
        Query query = entityManager.createQuery("select a from "+entityClass().getSimpleName()+" a");
        List<T> lista = query.getResultList();
        return lista;
    }
    
    @SuppressWarnings("unchecked")
	public List<T> listarCriteria(String nome, String like){
    	Criteria criteria = getSession().createCriteria(entityClass());
    	//	SEJA IGUAL
    	//	criteria.add(Restrictions.eq(nome, like));
    	/*
    	//	USANDO UMA EXPRESSÃO LÓGICA
    	Criteria c1 = (Criteria) Restrictions.like("nome", "%R%");
    	Criteria c2 = (Criteria) Restrictions.like("nome", "%R%");
    	LogicalExpression exp = Restrictions.or(c1, c2);
    	criteria.add(exp);
    	*/
    	//	CONTENHA ALGUMA LETRA DIGITADA
    	criteria.add(Restrictions.like(nome, "%" + like + "%"));
    	List<T> lista = criteria.list();
    	return lista;
    }

}
