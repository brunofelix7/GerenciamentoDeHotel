<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.com.hotel.Entity.Reserva" %>
<%@ page import="br.com.hotel.Entity.Quarto" %>
<%@ page import="br.com.hotel.Entity.Hospede" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Atualizar Reserva</title>
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
		Reserva reserva = (Reserva) request.getAttribute("reserva");
	%>

	<h1>Editar Reserva</h1>
	<hr/>
	<form method="POST" action="editar_reserva">
		<table>
			<tr>
				<td><label for="usr">Código:</label></td>
				<td><input class="form-control" type="text" name="id" readonly="readonly" value=<%=reserva.getId()%>></td>
			</tr>
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
						<option <% if(reserva.getHospede().getId() == h.getId()){out.println("selected='selected'");} %>value="<%= h.getId() %>" label="<%= h.getNome() %>"></option>
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
						<option <% if(reserva.getQuarto().getId() == q.getId()){out.println("selected='selected'");} %>value="<%= q.getId() %>" label="<%= q.getNumero() %>"></option>
						<%
							}
						%>
					</select>
				</td>
			</tr>
			<tr>
				<td><label for="usr">Data Início: </label></td>
				<td><input class="form-control" type="date" name="data_inicio" required="required" value=<%=reserva.getDataInicial() %>></td>
			</tr>
			<tr>
				<td><label for="usr">Data Fim: </label></td>
				<td><input class="form-control" type="date" name="data_fim" required="required" value=<%=reserva.getDataFinal() %>></td>
			</tr>
			<tr>
				<td><input class="btn btn-success" type="submit" value="Atualizar"/></td>
				<td><a class="btn btn-default" href="listagem_reservas"><b>Voltar</b></a></td>
			</tr>
		</table>
	</form>
</body>
</html>