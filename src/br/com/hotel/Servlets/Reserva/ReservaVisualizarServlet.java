package br.com.hotel.Servlets.Reserva;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.com.hotel.Entity.Reserva;
import br.com.hotel.Service.ReservaService;

@WebServlet("/visualizar_reserva")
@SuppressWarnings("serial")
public class ReservaVisualizarServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		
		ReservaService reservaService = new ReservaService();
		Reserva reserva = new Reserva();
		
		long id = Long.parseLong(request.getParameter("id"));
		reserva = reservaService.buscarPorId(id);
		request.setAttribute("reserva", reserva);
		request.getRequestDispatcher("reserva/visualizar_reserva.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
