<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.com.hotel.Service.UsuarioService" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gerenciamento de Hotel - Login</title>
<style type="text/css">
  	<%@ include file="/assets/css/bootstrap.css" %>
  	<%@ include file="/assets/css/estilo.css" %>
  		tr.a > td{
			padding-top: 1em;
		}
</style>
</head>
<body>
	<h2>Login</h2>
	<hr/>
	<%
		if(request.getParameter("msg") != null){
			if(request.getParameter("msg").equals("erro_login")){
				out.println("<div class='alert alert-danger' role='alert'>Usuário e/ou Senha inválidos</div>");
			}if(request.getParameter("msg").equals("erro")){
				out.println("<div class='alert alert-warning' role='alert'>Por favor, preencha todos os campos</div>");
			}		
		}
	%>
	
	<%
		// Sair
		if(request.getParameter("msg") != null){
			if(request.getParameter("msg").equals("logoff")){
				//	Recupera a sessao
				HttpSession sessao = request.getSession();
				sessao.removeAttribute("login");
				//	sessao.invalidate(); Remove todas as variáveis de sessões
				out.println("<div class='alert alert-success' role='alert'>Deslogado com sucesso</div>");
			}
		}
	%>
	
	<form method="POST" action="/GerenciamentoDeHotel/login">
		<table>
			<tr>
				<td><label for="usr">Usuario:</label></td>
			</tr>
			<tr>
				<td><input class="form-control" type="text" name="login"/></td>
			</tr>
			<tr>
				<td><label for="usr">Senha:</label></td>
			</tr>
			<tr>
				<td><input class="form-control" type="password" name="senha"/></td>
			</tr>
			<tr class="a">
				<td><input class="btn btn-primary" type="submit" value="Entrar"/></td>
			</tr>
		</table>
	</form>
</body>
</html>