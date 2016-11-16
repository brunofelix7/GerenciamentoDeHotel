<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.com.hotel.Entity.Hospede" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Visualizar Hospede</title>
<style type="text/css">
  	<%@ include file="/assets/css/bootstrap.css" %>
  	<%@ include file="/assets/css/estilo.css" %>
</style>
</head>
<body>

	<%
		Hospede hospede = (Hospede) request.getAttribute("hospede");
	%>
	
	<h1>Cadastro de Hospede - Detalhes</h1>
	<br/>
	
	<table class="table">
		<tr>
			<td><b>Código: </b></td>
			<td><%= hospede.getId()%></td>
		</tr>
		<tr>
			<td><b>Nome: </b></td>
			<td><%= hospede.getNome()%></td>
		</tr>
		<tr>
			<td><b>CPF: </b></td>
			<td><%= hospede.getCpf()%></td>
		</tr>
		<tr>
			<td><b>Email: </b></td>
			<td><%= hospede.getEmail()%></td>
		</tr>
		<tr>
			<td><b>Telefone: </b></td>
			<td><%= hospede.getTelefone()%></td>
		</tr>
		<tr>
			<td><b>Rua: </b></td>
			<td><%= hospede.getEndereco().getLogradouro()%></td>
		</tr>
		<tr>
			<td><b>Número: </b></td>
			<td><%= hospede.getEndereco().getNumero()%></td>
		</tr>
		<tr>
			<td><b>Bairro: </b></td>
			<td><%= hospede.getEndereco().getBairro()%></td>
		</tr>
		<tr>
			<td><b>Cidade: </b></td>
			<td><%= hospede.getEndereco().getCidade()%></td>
		</tr>
		<tr>
			<td><b>CEP: </b></td>
			<td><%= hospede.getEndereco().getCep()%></td>
		</tr>
	</table>
	<br/>
	<a class="btn btn-default" href="listagem_hospedes"><b>Voltar</b></a>
</body>
</html>