package br.com.hotel.Service;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.transaction.SystemException;
import javax.xml.bind.ValidationException;
import br.com.hotel.DAO.AbstractDAO;
import br.com.hotel.Entity.AbstractEntity;

public abstract class AbstractService<T extends AbstractEntity, D extends AbstractDAO<T>> {
	
    //  F·brica de conexıes
    @SuppressWarnings("static-access")
	static EntityManagerFactory fac = new Persistence().createEntityManagerFactory("db");

    protected EntityManager manager;
    
    protected abstract D newDAO(EntityManager manager);

    public void salvar(T entity) throws SystemException{
        manager = fac.createEntityManager();
        try{
            manager.getTransaction().begin();
            D dao = newDAO(manager);
            dao.salvar(entity);
            manager.getTransaction().commit();
        }catch(Exception e){
            manager.getTransaction().rollback();
            throw new SystemException("Erro ao salvar");
        }finally{
            manager.close();
        }
    }

    public void remover(T entity) throws SystemException{
        manager = fac.createEntityManager();
        try{
            manager.getTransaction().begin();
            if(entity.getId() == 0){
                throw new ValidationException("Id √© obrigat√≥rio");
            }
            D dao = newDAO(manager);
            entity = dao.buscarPorId(entity.getId());
            dao.remover(entity);
            manager.getTransaction().commit();
        }catch(Exception e){
            manager.getTransaction().rollback();
            throw new SystemException("Erro ao salvar");
        }finally{
            manager.close();
        }
    }

    public void atualizar(T entity) throws SystemException{
        manager = fac.createEntityManager();
        try{
            manager.getTransaction().begin();
            D dao = newDAO(manager);
            dao.atualizar(entity);
            manager.getTransaction().commit();
        }catch(Exception e){
            manager.getTransaction().rollback();
            throw new SystemException("Erro ao atualizar");
        }finally{
            manager.close();
        }
    }

    public T buscarPorId(Long id){
        manager = fac.createEntityManager(); 
        return newDAO(manager).buscarPorId(id);
    }

    public List<T> listar(){
        manager = fac.createEntityManager();
        return newDAO(manager).listar();
    }
    
    public List<T> listarCriteria(String campo, String like){
    	manager = fac.createEntityManager();
        return newDAO(manager).listarCriteria(campo, like);
    }

}
