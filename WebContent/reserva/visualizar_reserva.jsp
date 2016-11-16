<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.com.hotel.Entity.Reserva" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Visualizar Reserva</title>
<style type="text/css">
  	<%@ include file="/assets/css/bootstrap.css" %>
  	<%@ include file="/assets/css/estilo.css" %>
</style>
</head>
<body>

	<%
		Reserva reserva = (Reserva) request.getAttribute("reserva");
	%>
	
	<h1>Reserva - Detalhes</h1>
	<br/>
	
	<table class="table">
		<tr>
			<td><b>Número: </b></td>
			<td><%= reserva.getId()%></td>
		</tr>
		<tr>
			<td><b>Hospede: </b></td>
			<td><%= reserva.getHospede().getNome() %></td>
		</tr>
		<tr>
			<td><b>Quarto: </b></td>
			<td><%= reserva.getQuarto().getNumero() %></td>
		</tr>
		<tr>
			<td><b>Data Início: </b></td>
			<td><%= reserva.getDataInicial() %></td>
		</tr>
		<tr>
			<td><b>Data Fim: </b></td>
			<td><%= reserva.getDataFinal() %></td>
		</tr>
		<tr>
			<td><b>Data Checkin: </b></td>
			<td><%= reserva.getDataCheckIn() %></td>
		</tr>
		<tr>
			<td><b>Data Checkout: </b></td>
			<td><%= reserva.getDataCheckOut() %></td>
		</tr>
		<tr>
			<td><b>Status: </b></td>
			<td><span class="label label-danger"><%= reserva.getStatus() %></span></td>
		</tr>
		<tr>
			<td><b>Pago: </b></td>
			<td><span class="label label-danger"><%= reserva.getPago() %></span></td>
		</tr>
		<tr>
			<td><b>Total: </b></td>
			<td>R$ <%= reserva.getValorPago() %></td>
		</tr>
		<tr>
			<td><b>Forma de pagamento: </b></td>
			<td><%= reserva.getFormaDePagamento() %></td>
		</tr>
	</table>
	<br/>
	<a class="btn btn-default" href="listagem_reservas"><b>Voltar</b></a>
</body>
</html>