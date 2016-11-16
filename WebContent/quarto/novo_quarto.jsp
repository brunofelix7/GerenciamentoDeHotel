<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.com.hotel.Entity.Categoria" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Cadastro de Quarto</title>
	<style type="text/css">
		<%@ include file="/assets/css/bootstrap.css" %>
	  	<%@ include file="/assets/css/estilo.css" %>
		input.a{
			width: 8%;
		}
		tr > td{
			padding-bottom: 1em;
			padding-right: 1em;
		}
	</style>
</head>
<body>
	<h1>Cadastrar Quarto</h1>
	<hr/>
	<form method="POST" action="novo_quarto">
		<table>
			<tr>
				<td><label for="usr">Categoria: </label></td>
				<td>
					<select class="form-control" name="categoria" required="required">
						<option value="" label="-- Selecione --"></option>
						<%
							List<Categoria> categorias = new ArrayList<Categoria>();
							categorias = (List<Categoria>) request.getAttribute("categorias");
							for(Categoria c: categorias){
						%>
						<option value="<%= c.getId() %>" label="<%= c.getNome() %>"></option>
						<%
							}
						%>
					</select>
				</td>
			</tr>
			<tr>
				<td><label for="usr">Número: </label></td>
				<td><input class="form-control" type="text" name="numero" required="required"></td>
			</tr>
			<tr>
				<td><label for="usr">Andar: </label></td>
				<td><input class="form-control" type="text" name="andar" required="required"></td>
			</tr>
			<tr>
				<td><input class="btn btn-success" type="submit" value="Cadastrar"/></td>
				<td><a class="btn btn-default" href="listagem_quartos"><b>Voltar</b></a></td>
			</tr>
		</table>
	</form>
</body>
</html>