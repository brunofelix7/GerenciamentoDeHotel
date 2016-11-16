package br.com.hotel.Servlets.Quarto;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.SystemException;
import br.com.hotel.Entity.Quarto;
import br.com.hotel.Service.QuartoService;

@WebServlet("/remover_quarto")
@SuppressWarnings("serial")
public class QuartoRemoverServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		
		if(request.getParameter("id") != null){
			try {
				QuartoService quartoService = new QuartoService();
				long id = Long.parseLong(request.getParameter("id"));
				Quarto quarto = quartoService.buscarPorId(id);
				quartoService.remover(quarto);
				response.sendRedirect("listagem_quartos");
			} catch (SystemException e) {
				e.printStackTrace();
			}

		}
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
