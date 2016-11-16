package br.com.hotel.Entity;

import br.com.hotel.Enum.EnumStatus;
import br.com.hotel.Enum.EnumPagamento;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Reserva extends AbstractEntity{
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    
    @Column(name = "data_inicial")
    @Temporal(TemporalType.DATE)
    private Date dataInicial;
    
    @Column(name = "data_final")
    @Temporal(TemporalType.DATE)
    private Date dataFinal;
    
    @Column(name = "data_checkin", columnDefinition = "DATE DEFAULT NULL")
    @Temporal(TemporalType.DATE)
    private Date dataCheckIn;
    
    @Column(name = "data_checkout", columnDefinition = "DATE DEFAULT NULL")
    @Temporal(TemporalType.DATE)
    private Date dataCheckOut;

    @Column(name = "forma_pagamento")
    @Enumerated(EnumType.STRING)
    private EnumPagamento formaDePagamento;
    
    @Column(columnDefinition = "VARCHAR(30) DEFAULT 'PENDENTE'")
    @Enumerated(EnumType.STRING)
    private EnumStatus status;
    
    @Column(name = "pago", columnDefinition = "VARCHAR(30) DEFAULT 'NAO'")
    private String pago;
    
    @Column(name = "valor_pago")
    private double valorPago;
    
    @ManyToOne
    private Quarto quarto;
    
    @ManyToOne
    private Funcionario funcionario;
    
    @ManyToOne
    private Hospede hospede;
    
    
    
    public long getId() {
        return id;
    }
    public void setId(long id) {
        this.id = id;
    }
    public Date getDataInicial() {
        return dataInicial;
    }
    public void setDataInicial(Date dataInicial) {
        this.dataInicial = dataInicial;
    }
    public Date getDataFinal() {
        return dataFinal;
    }
    public void setDataFinal(Date dataFinal) {
        this.dataFinal = dataFinal;
    }
    public Date getDataCheckIn() {
        return dataCheckIn;
    }
    public void setDataCheckIn(Date dataCheckIn) {
        this.dataCheckIn = dataCheckIn;
    }
    public Date getDataCheckOut() {
        return dataCheckOut;
    }
    public void setDataCheckOut(Date dataCheckOut) {
        this.dataCheckOut = dataCheckOut;
    }
    public String getPago() {
		return pago;
	}
	public void setPago(String pago) {
		this.pago = pago;
	}
	public EnumPagamento getFormaDePagamento() {
        return formaDePagamento;
    }
    public void setFormaDePagamento(EnumPagamento formaDePagamento) {
        this.formaDePagamento = formaDePagamento;
    }
    public EnumStatus getStatus() {
        return status;
    }
    public void setStatus(EnumStatus status) {
        this.status = status;
    }
	public double getValorPago() {
		return valorPago;
	}
	public void setValorPago(double valorPago) {
		this.valorPago = valorPago;
	}
	public Quarto getQuarto() {
		return quarto;
	}
	public void setQuarto(Quarto quarto) {
		this.quarto = quarto;
	}
	public Funcionario getFuncionario() {
		return funcionario;
	}
	public void setFuncionario(Funcionario funcionario) {
		this.funcionario = funcionario;
	}
	public Hospede getHospede() {
		return hospede;
	}
	public void setHospede(Hospede hospede) {
		this.hospede = hospede;
	}
    

        
}
