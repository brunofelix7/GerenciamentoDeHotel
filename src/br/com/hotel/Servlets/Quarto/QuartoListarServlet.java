package br.com.hotel.Servlets.Quarto;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.com.hotel.Entity.Quarto;
import br.com.hotel.Service.QuartoService;

@WebServlet("/listagem_quartos")
@SuppressWarnings("serial")
public class QuartoListarServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		
		QuartoService quartoService = new QuartoService();
		List<Quarto> quartos = quartoService.listar();
		request.setAttribute("quartos", quartos);
		request.getRequestDispatcher("quarto/listagem_quartos.jsp").forward(request, response);
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
