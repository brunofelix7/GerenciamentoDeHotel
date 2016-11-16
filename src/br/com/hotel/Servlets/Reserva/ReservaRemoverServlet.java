package br.com.hotel.Servlets.Reserva;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.SystemException;
import br.com.hotel.Entity.Reserva;
import br.com.hotel.Service.ReservaService;

@WebServlet("/remover_reserva")
@SuppressWarnings("serial")
public class ReservaRemoverServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		
		if(request.getParameter("id") != null){
			try {
				ReservaService reservaService = new ReservaService();
				long id = Long.parseLong(request.getParameter("id"));
				Reserva reserva = reservaService.buscarPorId(id);
				reservaService.remover(reserva);
				response.sendRedirect("listagem_reservas");
			} catch (SystemException e) {
				e.printStackTrace();
			}

		}
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
