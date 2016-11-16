package br.com.hotel.Service;

import javax.persistence.EntityManager;
import br.com.hotel.DAO.QuartoDAO;
import br.com.hotel.Entity.Quarto;

import java.util.List;
import javax.transaction.SystemException;

public class QuartoService extends AbstractService<Quarto, QuartoDAO>{
    
    @Override
    protected QuartoDAO newDAO(EntityManager manager) {
        return new QuartoDAO(manager);
    }
    
    @Override
    public void salvar(Quarto quarto) throws SystemException{
        if(quarto == null){
            throw new SystemException("É necessário um quarto!");
        }
        super.salvar(quarto);
    }
    
    @Override
    public void remover(Quarto quarto) throws SystemException{
        if(quarto == null){
            throw new SystemException("É necessário um quarto!");
        }
        super.remover(quarto);
    }
    
    @Override
    public void atualizar(Quarto quarto) throws SystemException{
        if(quarto == null){
            throw new SystemException("É necessário um quarto!");
        }
        super.atualizar(quarto);
    }
    
    @Override
    public Quarto buscarPorId(Long id){
        return super.buscarPorId(id);
    }
    
    @Override
    public List<Quarto> listar(){
        return super.listar();
    }
    
    @Override
    public List<Quarto> listarCriteria(String nome, String like){
        return super.listarCriteria(nome, like);
    }
    
    
}
