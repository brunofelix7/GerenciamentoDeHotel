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

@WebServlet("/novo_quarto")
@SuppressWarnings("serial")
public class QuartoNovoServlet extends HttpServlet {
	
	private Categoria categoria;
	private CategoriaService categoriaService;
	private Quarto quarto;
	private QuartoService quartoService;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		
		CategoriaService categoriaService = new CategoriaService();
		List<Categoria> categorias = categoriaService.listar();
		request.setAttribute("categorias", categorias);
		request.getRequestDispatcher("quarto/novo_quarto.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//	Recuperando parâmetros
		String numero = request.getParameter("numero");
		String andar = request.getParameter("andar");
		long categoria_id = Long.parseLong(request.getParameter("categoria"));
		
		//	Validação
		
		try{
			//	Instanciando objetos
			categoria = new Categoria();
			quarto = new Quarto();
			quartoService = new QuartoService();
			categoriaService = new CategoriaService();
			
			//	Busca uma categoria pelo id
			categoria = categoriaService.buscarPorId(categoria_id);
			
			//	Atribuindo valores
			quarto.setNumero(numero);
			quarto.setAndar(andar);
			quarto.setCategoria(categoria);
			
			//	Persistindo dados
			quartoService.salvar(quarto);
			
			//	Redirecionando para tela de listagem de hospedes
			response.sendRedirect("listagem_quartos");
			
		}catch(SystemException erro){
			erro.printStackTrace();
		}
		
	}

}
