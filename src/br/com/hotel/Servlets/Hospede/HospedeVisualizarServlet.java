package br.com.hotel.Servlets.Hospede;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.hotel.Entity.Hospede;
import br.com.hotel.Service.HospedeService;

@WebServlet("/visualizar_hospede")
@SuppressWarnings("serial")
public class HospedeVisualizarServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		
		HospedeService hospedeService = new HospedeService();
		Hospede hospede = new Hospede();
		
		long id = Long.parseLong(request.getParameter("id"));
		hospede = hospedeService.buscarPorId(id);
		request.setAttribute("hospede", hospede);
		request.getRequestDispatcher("hospede/visualizar_hospede.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
