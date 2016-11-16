package br.com.hotel.Servlets.Hospede;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.com.hotel.Entity.Hospede;
import br.com.hotel.Service.HospedeService;

@WebServlet("/listagem_hospedes")
@SuppressWarnings("serial")
public class HospedeListarServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		
		HospedeService hospedeService = new HospedeService();
		List<Hospede> hospedes = hospedeService.listar();
		request.setAttribute("hospedes", hospedes);
		request.getRequestDispatcher("hospede/listagem_hospedes.jsp").forward(request, response);
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
