package br.com.hotel.Service;

import javax.persistence.EntityManager;
import br.com.hotel.DAO.UsuarioDAO;
import br.com.hotel.Entity.Usuario;

import java.util.List;
import javax.transaction.SystemException;

public class UsuarioService extends AbstractService<Usuario, UsuarioDAO> {
    
    @Override
    protected UsuarioDAO newDAO(EntityManager manager) {
        return new UsuarioDAO(manager);
    }
    
    @Override
    public void salvar(Usuario usuario) throws SystemException{
        if(usuario == null){
            throw new SystemException("É necessário um usuário!");
        }
        super.salvar(usuario);
    }
    
    @Override
    public void remover(Usuario usuario) throws SystemException{
        if(usuario == null){
            throw new SystemException("É necessário um usuário!");
        }
        super.remover(usuario);
    }
    
    @Override
    public void atualizar(Usuario usuario) throws SystemException{
        if(usuario == null){
            throw new SystemException("É necessário um usuário!");
        }
        super.atualizar(usuario);
    }
    
    @Override
    public Usuario buscarPorId(Long id){
        return super.buscarPorId(id);
    }
    
    @Override
    public List<Usuario> listar(){
        return super.listar();
    }
    
    
}
