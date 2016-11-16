<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="br.com.hotel.Entity.Quarto" %>
<%@ page import="br.com.hotel.Entity.Hospede" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Cadastro de Reserva</title>
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
	<h1>Cadastro de Reserva</h1>
	<hr/>
	<form method="POST" action="nova_reserva">
		<table>
			<tr>
				<td><label for="usr">Hospede: </label></td>
				<td>
					<select class="form-control" name="hospede" required="required">
						<option value="" label="-- Selecione --"></option>
						<%
							List<Hospede> hospedes = new ArrayList<Hospede>();
							hospedes = (List<Hospede>) request.getAttribute("hospedes");
							for(Hospede h: hospedes){
						%>
							<option value="<%= h.getId() %>" label="<%= h.getNome() %>"></option>
						<%
							}
						%>
					</select>
				</td>
			</tr>
			<tr>
				<td><label for="usr">Quarto: </label></td>
				<td>
					<select class="form-control" name="quarto" required="required">
						<option value="" label="-- Selecione --"></option>
						<%
							List<Quarto> quartos = new ArrayList<Quarto>();
							quartos = (List<Quarto>) request.getAttribute("quartos");
							for(Quarto q: quartos){
						%>
							<option value="<%= q.getId() %>" label="<%= q.getNumero() %>"></option>
						<%
							}
						%>
					</select>
				</td>
			</tr>
			<tr>
				<td><label for="usr">Data Início: </label></td>
				<td><input class="form-control" type="date" name="data_inicio" required="required"></td>
			</tr>
			<tr>
				<td><label for="usr">Data Fim: </label></td>
				<td><input class="form-control" type="date" name="data_fim" required="required"></td>
			</tr>
			<tr>
				<td><input class="btn btn-success" type="submit" value="Reservar"/></td>
				<td><a class="btn btn-default" href="listagem_reservas"><b>Voltar</b></a></td>
			</tr>
		</table>
	</form>
</body>
</html>