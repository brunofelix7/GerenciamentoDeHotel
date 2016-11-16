package br.com.hotel.Enum;

public enum EnumStatus {
    
	PENDENTE("Pendente"),
    RESERVADO("Reservado"),
    DISPONIVEL("Disponivel");
    
    private String descricao;
    
    EnumStatus(String descricao){
        this.descricao = descricao;
    }
    
    public String getDescricao(){
        return descricao;
    }
    
}
