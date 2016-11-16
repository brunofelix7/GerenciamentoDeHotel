package br.com.hotel.Servlets.Quarto;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.SystemException;

import br.com.hotel.Entity.Categoria;
import br.com.hotel.Entity.Quarto;
import br.com.hotel.Service.CategoriaService;
import br.com.hotel.Service.QuartoService;

@WebServlet("/editar_quarto")
@SuppressWarnings("serial")
public class QuartoEditarServlet extends HttpServlet {
	
	private Quarto quarto;
	private Categoria categoria;
	private QuartoService quartoService;
	private CategoriaService categoriaService;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html");
		
		QuartoService quartoService = new QuartoService();
		Quarto quarto = new Quarto();
		CategoriaService categoriaService = new CategoriaService();
		
		List<Categoria> categorias = categoriaService.listar();
		
		long id = Long.parseLong(request.getParameter("id"));
		quarto = quartoService.buscarPorId(id);
		request.setAttribute("quarto", quarto);
		request.setAttribute("categorias", categorias);
		request.getRequestDispatcher("quarto/editar_quarto.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//	Recuperando parâmetros
		long id = Long.parseLong(request.getParameter("id"));
		String numero = request.getParameter("numero");
		String andar = request.getParameter("andar");
		long getCategoria = Long.parseLong(request.getParameter("categoria"));
		
		//	Validação
		
		try{
			//	Instanciando objetos
			quarto = new Quarto();
			categoria = new Categoria();
			quartoService = new QuartoService();
			categoriaService = new CategoriaService();
			
			//	Busca pelo id vindo do parâmetro
			quarto = quartoService.buscarPorId(id);
			categoria = categoriaService.buscarPorId(getCategoria);
			
			//	Atribuindo valores
			quarto.setNumero(numero);
			quarto.setAndar(andar);
			quarto.setCategoria(categoria);
			
			//	Atualiza os dados
			quartoService.atualizar(quarto);
			
			//	Redirecionando para tela de listagem de hospedes
			response.sendRedirect("listagem_quartos");
		}catch(SystemException erro){
			erro.printStackTrace();
		}
		
	}

}
