<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.com.hotel.Entity.Quarto" %>
<%@ page import="br.com.hotel.Entity.Categoria" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Atualizar Quarto</title>
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
	<%
		Quarto quarto = (Quarto) request.getAttribute("quarto");
	%>

	<h1>Editar Quarto</h1>
	<hr/>
	<form method="POST" action="editar_quarto">
		<table>
			<tr>
				<td><label for="usr">Código:</label></td>
				<td><input class="form-control" type="text" name="id" readonly="readonly" value=<%=quarto.getId()%>></td>
			</tr>
			<tr>
				<td><label for="usr">Categoria:</label></td>
				<td>
					<select class="form-control" name="categoria" required="required">
						<option value="" label="-- Selecione --"></option>
						<%
							List<Categoria> categorias = new ArrayList<Categoria>();
							categorias = (List<Categoria>) request.getAttribute("categorias");
							for(Categoria c: categorias){
						%>
						<option <% if(quarto.getCategoria().getId() == c.getId()){out.println("selected='selected'");} %>value="<%= c.getId() %>" label="<%= c.getNome() %>"></option>
						<%
							}
						%>
					</select>
				</td>
			</tr>
			<tr>
				<td><label for="usr">Numero:</label></td>
				<td><input class="form-control" type="text" name="numero" required="required" value=<%=quarto.getNumero()%>></td>
			</tr>
			<tr>
				<td><label for="usr">Andar:</label></td>
				<td><input class="form-control" type="text" name="andar" required="required" value=<%=quarto.getAndar()%>></td>
			</tr>
			<tr>
				<td><input class="btn btn-success" type="submit" value="Atualizar"/></td>
				<td><a class="btn btn-default" href="listagem_quartos"><b>Voltar</b></a></td>
			</tr>
		</table>
	</form>
</body>
</html>