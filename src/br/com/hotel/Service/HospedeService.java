package br.com.hotel.Service;

import java.util.List;
import javax.persistence.EntityManager;
import javax.transaction.SystemException;
import br.com.hotel.DAO.HospedeDAO;
import br.com.hotel.Entity.Hospede;

public class HospedeService extends AbstractService<Hospede, HospedeDAO>{
	
	@Override
    protected HospedeDAO newDAO(EntityManager manager) {
        return new HospedeDAO(manager);
    }
    
    @Override
    public void salvar(Hospede hospede) throws SystemException{
        if(hospede == null){
            throw new SystemException("Hospede não encontrado!");
        }
        super.salvar(hospede);
    }
    
    @Override
    public void remover(Hospede hospede) throws SystemException{
        if(hospede == null){
            throw new SystemException("Hospede não encontrado!");
        }
        super.remover(hospede);
    }
    
    @Override
    public void atualizar(Hospede hospede) throws SystemException{
        if(hospede == null){
            throw new SystemException("Hospede não encontrado!");
        }
        super.atualizar(hospede);
    }
    
    @Override
    public Hospede buscarPorId(Long id){
        return super.buscarPorId(id);
    }
    
    @Override
    public List<Hospede> listar(){
        return super.listar();
    }

}
