package br.com.hotel.Service;

import javax.persistence.EntityManager;
import br.com.hotel.DAO.ReservaDAO;
import br.com.hotel.Entity.Reserva;

import java.util.List;
import javax.transaction.SystemException;

public class ReservaService extends AbstractService<Reserva, ReservaDAO> {
    
    @Override
    protected ReservaDAO newDAO(EntityManager manager) {
        return new ReservaDAO(manager);
    }
    
    @Override
    public void salvar(Reserva reserva) throws SystemException{
        if(reserva == null){
            throw new SystemException("É necessário uma reserva!");
        }
        super.salvar(reserva);
    }
    
    @Override
    public void remover(Reserva reserva) throws SystemException{
        if(reserva == null){
            throw new SystemException("É necessário uma reserva!");
        }
        super.remover(reserva);
    }
    
    @Override
    public void atualizar(Reserva reserva) throws SystemException{
        if(reserva == null){
            throw new SystemException("É necessário uma reserva!");
        }
        super.atualizar(reserva);
    }
    
    @Override
    public Reserva buscarPorId(Long id){
        return super.buscarPorId(id);
    }
    
    @Override
    public List<Reserva> listar(){
        return super.listar();
    }
    
}
