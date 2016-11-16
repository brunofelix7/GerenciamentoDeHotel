package br.com.hotel.Servlets.Login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.SystemException;

import br.com.hotel.Entity.Usuario;
import br.com.hotel.Service.UsuarioService;

@WebServlet("/usuario")
@SuppressWarnings("serial")
public class NovoUsuarioServlet extends HttpServlet {
	
	private Usuario usuario;
	private UsuarioService usuarioService;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		//	Recuperando parâmetros
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		String confirmarSenha = request.getParameter("confirmar_senha");
		
		//	Validação
		if(login.trim().isEmpty() || senha.trim().isEmpty() || confirmarSenha.trim().isEmpty()){
			response.sendRedirect("/GerenciamentoDeHotel/login/novo_usuario.jsp?msg=erro");
			return;
		}if(!senha.equals(confirmarSenha)){
			response.sendRedirect("/GerenciamentoDeHotel/login/novo_usuario.jsp?msg=erro_confirmacao");
			return;
		}else{
			try{
				//	Atribuindo valores
				usuario = new Usuario(login, senha);
				
				// Cadastrando usuário
				usuarioService = new UsuarioService();
				usuarioService.salvar(usuario);
				response.sendRedirect("login/login.jsp");
			}catch(SystemException erro){
				erro.printStackTrace();
			}
		}
	}

}
