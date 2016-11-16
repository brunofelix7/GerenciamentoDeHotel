package br.com.hotel.Service;

import javax.persistence.EntityManager;
import br.com.hotel.DAO.ProdutoDAO;
import br.com.hotel.Entity.Produto;

import java.util.List;
import javax.transaction.SystemException;

public class ProdutoService extends AbstractService<Produto, ProdutoDAO>{
    
     @Override
    protected ProdutoDAO newDAO(EntityManager manager) {
        return new ProdutoDAO(manager);
    }
    
    public void salvar(Produto produto) throws SystemException{
        if(produto == null){
            throw new SystemException("É necessário um produto!");
        }
        super.salvar(produto);
    }
    
    @Override
    public void remover(Produto produto) throws SystemException{
        if(produto == null){
            throw new SystemException("É necessário um produto!");
        }
        super.remover(produto);
    }
    
    @Override
    public void atualizar(Produto produto) throws SystemException{
        if(produto == null){
            throw new SystemException("É necessário um produto!");
        }
        super.atualizar(produto);
    }
    
    @Override
    public Produto buscarPorId(Long id){
        return super.buscarPorId(id);
    }
    
    @Override
    public List<Produto> listar(){
        return super.listar();
    }
    
    
}
