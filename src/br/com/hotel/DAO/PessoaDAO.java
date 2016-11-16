package br.com.hotel.DAO;

import javax.persistence.EntityManager;

import br.com.hotel.Entity.Pessoa;

/** 
 * @author Bruno Felix
 */
public class PessoaDAO extends AbstractDAO<Pessoa>{
    
    public PessoaDAO(EntityManager entityManager) {
        super(entityManager);
    }
    
    @Override
    protected Class<Pessoa> entityClass() {
        return Pessoa.class;
    }
 
}
