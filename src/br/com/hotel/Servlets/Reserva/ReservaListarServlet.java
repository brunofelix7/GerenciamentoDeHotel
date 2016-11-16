package br.com.hotel.Servlets.Reserva;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.com.hotel.Entity.Reserva;
import br.com.hotel.Service.ReservaService;

@WebServlet("/listagem_reservas")
@SuppressWarnings("serial")
public class ReservaListarServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		
		ReservaService reservaService = new ReservaService();
		List<Reserva> reservas = reservaService.listar();
		request.setAttribute("reservas", reservas);
		request.getRequestDispatcher("reserva/listagem_reservas.jsp").forward(request, response);
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
