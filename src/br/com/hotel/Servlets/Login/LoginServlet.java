package br.com.hotel.Servlets.Login;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.omg.CORBA.SystemException;
import br.com.hotel.Entity.Usuario;
import br.com.hotel.Service.UsuarioService;

/**
 * Servlet de controle do login do usuário
 */
@WebServlet("/login")
@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet{
	
	UsuarioService usuarioService = new UsuarioService();
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		response.setContentType("text/html");
		request.getRequestDispatcher("login/login.jsp").forward(request, response);
		
	}
		
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		//	Recuperando parâmetros
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		
		//	Validação
		if(login.trim().isEmpty() || senha.trim().isEmpty()){
			response.sendRedirect("login?msg=erro");
			return;
		}
		try{
			List<Usuario> usuario = usuarioService.listar();
			for(Usuario u: usuario){
				if(login.equals(u.getLogin()) && senha.equals(u.getSenha())){
					
					// Entrando na sessão
					HttpSession session = request.getSession();
					session.setAttribute("login", login);
					response.sendRedirect("listagem_hospedes");
					return;
				}else{
					response.sendRedirect("login?msg=erro_login");
				}
			}
		}catch(SystemException erro){
			erro.printStackTrace();
		}
		
	}

}
