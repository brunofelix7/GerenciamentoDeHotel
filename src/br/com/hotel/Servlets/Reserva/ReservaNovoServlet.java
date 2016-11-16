package br.com.hotel.Servlets.Reserva;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.SystemException;

import br.com.hotel.Entity.Hospede;
import br.com.hotel.Entity.Quarto;
import br.com.hotel.Entity.Reserva;
import br.com.hotel.Enum.EnumStatus;
import br.com.hotel.Service.HospedeService;
import br.com.hotel.Service.QuartoService;
import br.com.hotel.Service.ReservaService;

@WebServlet("/nova_reserva")
@SuppressWarnings("serial")
public class ReservaNovoServlet extends HttpServlet {
	
	private Hospede hospede;
	private Quarto quarto;
	private Reserva reserva;
	private ReservaService reservaService;
	private HospedeService hospedeService;
	private QuartoService quartoService;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		
		QuartoService quartoService = new QuartoService();
		HospedeService hospedeService = new HospedeService();
		
		List<Hospede> hospedes = hospedeService.listar();
		List<Quarto> quartos = quartoService.listar();
		
		request.setAttribute("hospedes", hospedes);
		request.setAttribute("quartos", quartos);
		request.getRequestDispatcher("reserva/nova_reserva.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//	Recuperando parâmetros
		long getHospede = Long.parseLong(request.getParameter("hospede"));
		long getQuarto = Long.parseLong(request.getParameter("quarto"));
		Date data_inicio = Date.valueOf(request.getParameter("data_inicio"));
		Date data_fim = Date.valueOf(request.getParameter("data_fim"));
		
		//	Validação
		
		try{
			//	Instanciando objetos
			hospede = new Hospede();
			quarto = new Quarto();
			reserva = new Reserva();
			reservaService = new ReservaService();
			hospedeService = new HospedeService();
			quartoService = new QuartoService();
			
			//	Busca um hospede e um quarto pelo id
			hospede = hospedeService.buscarPorId(getHospede);
			quarto = quartoService.buscarPorId(getQuarto);
			
			//	Atribuindo valores
			reserva.setDataInicial(data_inicio);
			reserva.setDataFinal(data_fim);
			reserva.setStatus(EnumStatus.PENDENTE);
			reserva.setPago("NÃO");
			reserva.setHospede(hospede);
			reserva.setQuarto(quarto);
			
			//	Persistindo dados
			reservaService.salvar(reserva);
			
			//	Redirecionando para tela de listagem de hospedes
			response.sendRedirect("listagem_reservas");
			
		}catch(SystemException erro){
			erro.printStackTrace();
		}
		
	}

}
