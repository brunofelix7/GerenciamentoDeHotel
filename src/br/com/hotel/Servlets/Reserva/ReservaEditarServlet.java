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
import br.com.hotel.Service.HospedeService;
import br.com.hotel.Service.QuartoService;
import br.com.hotel.Service.ReservaService;

@WebServlet("/editar_reserva")
@SuppressWarnings("serial")
public class ReservaEditarServlet extends HttpServlet {
	
	private Reserva reserva;
	private Hospede hospede;
	private Quarto quarto;
	private ReservaService reservaService;
	private HospedeService hospedeService;
	private QuartoService quartoService;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html");
		
		ReservaService reservaService = new ReservaService();
		QuartoService quartoService = new QuartoService();
		HospedeService hospedeService = new HospedeService();
		Reserva reserva = new Reserva();
		
		List<Quarto> quartos = quartoService.listar();
		List<Hospede> hospedes = hospedeService.listar();
		
		long id = Long.parseLong(request.getParameter("id"));
		reserva = reservaService.buscarPorId(id);
		request.setAttribute("reserva", reserva);
		request.setAttribute("quartos", quartos);
		request.setAttribute("hospedes", hospedes);
		request.getRequestDispatcher("reserva/editar_reserva.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//	Recuperando parâmetros
		long id = Long.parseLong(request.getParameter("id"));
		Date data_inicio = Date.valueOf(request.getParameter("data_inicio"));
		Date data_fim = Date.valueOf(request.getParameter("data_fim"));
		long getHospede = Long.parseLong(request.getParameter("hospede"));
		long getQuarto = Long.parseLong(request.getParameter("quarto"));
		
		//	Validação
		
		try{
			//	Instanciando objetos
			reserva = new Reserva();
			hospede = new Hospede();
			quarto = new Quarto();
			reservaService = new ReservaService();
			hospedeService = new HospedeService();
			quartoService = new QuartoService();
			
			//	Busca pelo id vindo do parâmetro
			reserva = reservaService.buscarPorId(id);
			hospede = hospedeService.buscarPorId(getHospede);
			quarto = quartoService.buscarPorId(getQuarto);
			
			//	Atribuindo valores
			reserva.setDataInicial(data_inicio);
			reserva.setDataFinal(data_fim);
			reserva.setHospede(hospede);
			reserva.setQuarto(quarto);
					
			//	Persistindo dados
			reservaService.atualizar(reserva);
			
			//	Redirecionando para tela de listagem de reservas
			response.sendRedirect("listagem_reservas");
		}catch(SystemException erro){
			erro.printStackTrace();
		}
		
	}

}
