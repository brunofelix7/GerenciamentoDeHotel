package br.com.hotel.Servlets.Hospede;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.SystemException;

import br.com.hotel.Entity.Hospede;
import br.com.hotel.Service.HospedeService;

@WebServlet("/remover_hospede")
@SuppressWarnings("serial")
public class HospedeRemoverServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		
		if(request.getParameter("id") != null){
			try {
				HospedeService hospedeService = new HospedeService();
				long id = Long.parseLong(request.getParameter("id"));
				Hospede hospede = hospedeService.buscarPorId(id);
				hospedeService.remover(hospede);
				response.sendRedirect("listagem_hospedes");
			} catch (SystemException e) {
				e.printStackTrace();
			}

		}
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
