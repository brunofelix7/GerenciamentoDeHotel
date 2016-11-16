<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gerenciamento de Hotel - Novo Usuário</title>
<style type="text/css">
  	<%@ include file="/assets/css/bootstrap.css" %>
  	<%@ include file="/assets/css/estilo.css" %>
</style>
</head>
<body>
	<h2>Novo Usuário</h2>
	
	<%
		if(request.getParameter("msg") != null){
			if(request.getParameter("msg").equals("erro")){
	%>
		<i style="color:red;">Por favor, preencha todos os campos</i>		
	<%			
			}if(request.getParameter("msg").equals("erro_confirmacao")){
	%>
		<i style="color:red;">Senhas incompatíveis</i>
	<%
			}
		}
	%>
	
	<form method="POST" action="/GerenciamentoDeHotel/usuario">
		<label>Login</label>
		<br/>
		<input type="text" name="login"/>
		<br/>
		<label>Senha</label>
		<br/>
		<input type="password" name="senha"/>
		<br/>
		<label>Confirmar senha</label>
		<br/>
		<input type="password" name="confirmar_senha">
		<br/>
		<input type="submit" value="Cadastrar"/>
	</form>
</body>
</html>