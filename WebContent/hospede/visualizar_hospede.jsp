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
	
	<h1>Registro de Hospede - Detalhes</h1>
	<hr/>
	
	<div>
		<figure>
			<img style="width: 10%; height: 10%;" src="assets/image/User.png" alt="user"/>
			<figcaption><h3><%= hospede.getNome()%></h3></figcaption>
			<hr/>
		</figure>
	</div>

	<table>
		<tr>
			<td style="padding-bottom: 10px;"><b>Código: </b></td>
			<td style="padding-left: 10px; padding-bottom: 10px;"><%= hospede.getId()%></td>
		</tr>
		<tr>
			<td style="padding-bottom: 10px;"><b>CPF: </b></td>
			<td style="padding-left: 10px; padding-bottom: 10px;"><%= hospede.getCpf()%></td>
		</tr>
		<tr>
			<td style="padding-bottom: 10px;"><b>Email: </b></td>
			<td style="padding-left: 10px; padding-bottom: 10px;"><%= hospede.getEmail()%></td>
		</tr>
		<tr>
			<td style="padding-bottom: 10px;"><b>Telefone: </b></td>
			<td style="padding-left: 10px; padding-bottom: 10px;"><%= hospede.getTelefone()%></td>
		</tr>
		<tr>
			<td style="padding-bottom: 10px;"><b>Rua: </b></td>
			<td style="padding-left: 10px; padding-bottom: 10px;"><%= hospede.getEndereco().getLogradouro()%></td>
		</tr>
		<tr>
			<td style="padding-bottom: 10px;"><b>Número: </b></td>
			<td style="padding-left: 10px; padding-bottom: 10px;"><%= hospede.getEndereco().getNumero()%></td>
		</tr>
		<tr>
			<td style="padding-bottom: 10px;"><b>Bairro: </b></td>
			<td style="padding-left: 10px; padding-bottom: 10px;"><%= hospede.getEndereco().getBairro()%></td>
		</tr>
		<tr>
			<td style="padding-bottom: 5px;"><b>Cidade: </b></td>
			<td style="padding-left: 10px; padding-bottom: 10px;"><%= hospede.getEndereco().getCidade()%></td>
		</tr>
		<tr>
			<td style="padding-bottom: 10px;"><b>CEP: </b></td>
			<td style="padding-left: 10px; padding-bottom: 10px;"><%= hospede.getEndereco().getCep()%></td>
		</tr>
	</table>
	<br/>
	<a class="btn btn-default" href="listagem_hospedes"><b>Voltar</b></a>
</body>
</html>