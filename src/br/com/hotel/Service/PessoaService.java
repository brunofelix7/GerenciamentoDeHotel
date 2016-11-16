package br.com.hotel.Service;

import javax.persistence.EntityManager;
import br.com.hotel.DAO.PessoaDAO;
import br.com.hotel.Entity.Pessoa;

import java.util.List;
import javax.transaction.SystemException;

public class PessoaService extends AbstractService<Pessoa, PessoaDAO> {

    @Override
    protected PessoaDAO newDAO(EntityManager manager) {
        return new PessoaDAO(manager);
    }
    
    @Override
    public void salvar(Pessoa pessoa) throws SystemException{
        if(pessoa == null){
            throw new SystemException("Pessoa não encontrada!");
        }
        super.salvar(pessoa);
    }
    
    @Override
    public void remover(Pessoa pessoa) throws SystemException{
        if(pessoa == null){
            throw new SystemException("Pessoa não encontrada!");
        }
        super.remover(pessoa);
    }
    
    @Override
    public void atualizar(Pessoa pessoa) throws SystemException{
        if(pessoa == null){
            throw new SystemException("Pessoa não encontrada!");
        }
        super.atualizar(pessoa);
    }
    
    @Override
    public Pessoa buscarPorId(Long id){
        return super.buscarPorId(id);
    }
    
    @Override
    public List<Pessoa> listar(){
        return super.listar();
    }
        
}
