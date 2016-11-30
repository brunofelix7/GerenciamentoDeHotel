<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.com.hotel.Entity.Reserva" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Listagem de Reservas</title>
	<link rel="stylesheet" href="/assets/css/estilo.css"/>
	<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
	<style type="text/css">
		body{
			margin: 20px;
		}
		a{
			text-decoration: none;
		}
		input.a{
			width: 30%;
		}
		tr > td
		{
		  padding-bottom: 1em;
		  padding-right: 1em;
		}
	</style>
	<script>
		function apagar(id){
			if(window.confirm("Deseja realmente apagar?")){
				window.location = "remover_reserva?id=" + id;
			}
		}
	</script>
</head>
<body>

	<h1>Listagem de Reservas</h1>
	<hr/>

	<!-- MENU -->
	<ul class="nav nav-pills">
		<li role="presentation" class="active"><a href="/">Home</a></li>
		<li role="presentation"><a href="#">Categorias</a></li>
		<li role="presentation"><a href="listagem_quartos">Quartos</a></li>
		<li role="presentation"><a href="listagem_hospedes">Hospedes</a></li>
		<li role="presentation"><a href="listagem_reservas">Reservas</a></li>
		<li role="presentation"><a href="#">Disponibilidade</a></li>
		<li role="presentation" class="active"><a href="login?msg=logoff">Logout</a></li>
	</ul>
	<br/>
	<br/>
	
	<!-- PESQUISA -->
	<table>
		<tr>
			<td><input class="form-control" type="date" name="pesquisa" placeholder="Data Início" /></td>
			<td><input class="form-control" type="date" name="pesquisa" placeholder="Data Fim" /></td>
			<td>
				<select class="form-control" name="status" required="required">
					<option value="" label="-- Status --"></option>
					<option value="Cancelado" label="Cancelado"></option>
					<option value="Pendente" label="Pendente"></option>
					<option value="Reservado" label="Reservado"></option>
				</select>
			</td>
		</tr>
		<tr>
			<td>
				<select class="form-control" name="status" required="required">
					<option value="" label="-- Cliente --"></option>
					<option value="Bruno" label="Bruno"></option>
						<option value="Emerson" label="Emerson"></option>
						<option value="João" label="João"></option>
				</select>
			</td>
			<td>
				<select class="form-control" name="status" required="required">
					<option value="" label="-- Quarto --"></option>
					<option value="Simples" label="Simples"></option>
					<option value="Duplo" label="Duplo"></option>
					<option value="Triplo" label="Triplo"></option>
				</select>
			</td>
			</tr>
			<tr>
				<td><input class="btn btn-default" type="submit" name="pesquisar" value="Pesquisar"/></td>
			</tr>
	</table>
	<br/>
	
	<!-- CADASTRAR NOVO -->
	<a href='nova_reserva' class="btn btn-success"><span class="glyphicon glyphicon-plus-sign"></span> Cadastrar</span></a>
	<br/><br/>

	<!-- LISTAGEM -->
	<table class="table" width="100%">
		<thead>
			<tr>
				<td><b>Número</b></td>
				<td><b>Data Início</b></td>
				<td><b>Data Fim</b></td>
				<td><b>Checkin</b></td>
				<td><b>Checkout</b></td>
				<td><b>Cliente</b></td>
				<td><b>Quarto</b></td>
				<td><b>Status</b></td>
				<td><b>Paga</b></td>
			</tr>
		</thead>
		<tbody>
			<% 
				List<Reserva> reservas = new ArrayList<Reserva>();
				reservas = (List<Reserva>) request.getAttribute("reservas"); 
			%>
			<% for(Reserva r: reservas){ %>
				<tr>
					<td><%= r.getId() %></td>
					<td><%= r.getDataInicial() %></td>
					<td><%= r.getDataFinal() %></td>
					<td><%= r.getDataCheckIn() %></td>
					<td><%= r.getDataCheckOut() %></td>
					<td><%= r.getHospede().getNome() %></td>
					<td><%= r.getQuarto().getNumero() %></td>
					<td><%= r.getStatus() %></td>
					<td><%= r.getPago() %></td>
					<td><a class="btn btn-primary" href="editar_reserva?id=<%= r.getId() %>"><span class="glyphicon glyphicon-pencil"></span></a></td>
					<td><a class="btn btn-primary" href="visualizar_reserva?id=<%= r.getId() %>"><span class="glyphicon glyphicon-eye-open"></span></a></td>	
					<td><a class="btn btn-danger" href="#" onclick="apagar('<%= r.getId() %>')"><span class="glyphicon glyphicon-remove-sign"></span></a></td>
				</tr>
			<%		
				}
			%>
		</tbody>
	</table>
<!-- jQuery / Bootstrap js-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
</body>
</html>