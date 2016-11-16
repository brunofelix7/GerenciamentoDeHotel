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
				out.println("<i style='color:red;'>Usu�rio/Senha inv�lidos</i>");
			}if(request.getParameter("msg").equals("erro")){
				out.println("<i style='color:red;'>Por favor, preencha todos os campos</i>");
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
				//	sessao.invalidate(); Remove todas as vari�veis de sess�es
				out.println("<span style='color:green;'>Deslogado com sucesso!</span>");
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
				<td><input class="btn btn-info" type="submit" value="Entrar"/></td>
			</tr>
		</table>
	</form>
</body>
</html>