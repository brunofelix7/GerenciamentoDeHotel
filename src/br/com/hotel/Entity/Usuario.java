package br.com.hotel.Entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Usuario extends AbstractEntity{
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    
    private String login;
    
    private String senha;

    
    public Usuario(String login, String senha){
        this.login = login;
        this.senha = senha;
    }
    
    public Usuario(){
        super();
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }    
    
}
