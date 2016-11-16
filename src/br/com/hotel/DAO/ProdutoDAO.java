package br.com.hotel.DAO;

import javax.persistence.EntityManager;

import br.com.hotel.Entity.Produto;

/**
 * @author Bruno Felix
 */
public class ProdutoDAO extends AbstractDAO<Produto>{
    
    public ProdutoDAO(EntityManager entityManager){
        super(entityManager);
    }
    
    @Override
    protected Class<Produto> entityClass(){
        return Produto.class;
    }
    
}
