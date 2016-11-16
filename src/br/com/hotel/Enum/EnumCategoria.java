package br.com.hotel.Enum;

public enum EnumCategoria {
	
	NORMAL("Normal"),
	SUITE("Suite"),
	PRIVATE("Private");
	
	private String value;
	
	EnumCategoria(String value){
		this.value = value;
	}

	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	

}
