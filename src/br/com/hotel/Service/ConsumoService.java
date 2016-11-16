package br.com.hotel.Service;

import javax.persistence.EntityManager;
import br.com.hotel.DAO.ConsumoDAO;
import br.com.hotel.Entity.Consumo;

import java.util.List;
import javax.transaction.SystemException;

public class ConsumoService extends AbstractService<Consumo, ConsumoDAO>{
    
    @Override
    protected ConsumoDAO newDAO(EntityManager manager) {
        return new ConsumoDAO(manager);
    }
    
    @Override
    public void salvar(Consumo consumo) throws SystemException{
        if(consumo == null){
            throw new SystemException("É necessário um consumo!");
        }
        super.salvar(consumo);
    }
    
    @Override
    public void remover(Consumo consumo) throws SystemException{
        if(consumo == null){
            throw new SystemException("É necessário um consumo!");
        }
        super.remover(consumo);
    }
    
    @Override
    public void atualizar(Consumo consumo) throws SystemException{
        if(consumo == null){
            throw new SystemException("É necessário um consumo!");
        }
        super.atualizar(consumo);
    }
    
    @Override
    public Consumo buscarPorId(Long id){
        return super.buscarPorId(id);
    }
    
    @Override
    public List<Consumo> listar(){
        return super.listar();
    }
    
}
