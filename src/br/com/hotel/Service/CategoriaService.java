package br.com.hotel.Service;

import javax.persistence.EntityManager;
import br.com.hotel.DAO.CategoriaDAO;
import br.com.hotel.Entity.Categoria;

import java.util.List;
import javax.transaction.SystemException;

public class CategoriaService extends AbstractService<Categoria, CategoriaDAO> {
    
    @Override
    protected CategoriaDAO newDAO(EntityManager manager) {
        return new CategoriaDAO(manager);
    }
    
    @Override
    public void salvar(Categoria categoria) throws SystemException{
        if(categoria == null){
            throw new SystemException("É necessário uma categoria!");
        }
        super.salvar(categoria);
    }
    
    @Override
    public void remover(Categoria categoria) throws SystemException{
        if(categoria == null){
            throw new SystemException("É necessário uma categoria!");
        }
        super.remover(categoria);
    }
    
    @Override
    public void atualizar(Categoria categoria) throws SystemException{
        if(categoria == null){
            throw new SystemException("É necessário uma categoria!");
        }
        super.atualizar(categoria);
    }
    
    @Override
    public Categoria buscarPorId(Long id){
        return super.buscarPorId(id);
    }
    
    @Override
    public List<Categoria> listar(){
        return super.listar();
    }
    
    
}
