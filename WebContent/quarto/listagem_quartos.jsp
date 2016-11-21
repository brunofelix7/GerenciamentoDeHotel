<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.com.hotel.Entity.Quarto" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Listagem de Quartos</title>
	<link rel="stylesheet" href="/assets/css/estilo.css"/>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"/>
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
				window.location = "remover_quarto?id=" + id;
			}
		}
	</script>
</head>
<body>

	<h1>Listagem de Quartos</h1>
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
	<form action="pesquisar_quarto" method="GET">
		<table>
			<tr>
				<td><input class="form-control" type="text" name="numero" placeholder="Número" /></td>
				<td>
					<select class="form-control" name="categoria">
						<option value="" label="-- Selecione --"></option>
						<option value="Simples" label="Simples"></option>
						<option value="Duplo" label="Duplo"></option>
						<option value="Triplo" label="Triplo"></option>
					</select>
				</td>
				<td><input class="btn btn-default" type="submit" value="Pesquisar"/></td>
			</tr>
		</table>
	</form>
	<br/>

	<!-- CADASTRAR NOVO -->
	<a href='novo_quarto' class="btn btn-success"><span class="glyphicon glyphicon-plus-sign"></span> Cadastrar</span></a>
	<br/><br/>

	<!-- LISTAGEM -->
	<table class="table" width="100%">
		<thead>
			<tr>
				<td><b>Código</b></td>
				<td><b>Número</b></td>
				<td><b>Andar</b></td>
				<td><b>Categoria</b></td>
			</tr>
		</thead>
		<tbody>
			<% 
				List<Quarto> quartos = new ArrayList<Quarto>();
				quartos = (List<Quarto>) request.getAttribute("quartos"); 
			%>
			<% for(Quarto q: quartos){ %>
				<tr>
					<td><%= q.getId() %></td>
					<td><%= q.getNumero() %></td>
					<td><%= q.getAndar() %></td>
					<td><%= q.getCategoria().getNome() %></td>
					<td><a class="btn btn-primary" href="editar_quarto?id=<%= q.getId() %>"><span class="glyphicon glyphicon-pencil"></span></a></td>
					<td><a class="btn btn-danger" href="#" onclick="apagar('<%= q.getId() %>')"><span class="glyphicon glyphicon-remove-sign"></span></a></td>
				</tr>
			<%		
				}
			%>
		</tbody>
	</table>
<!-- jQuery / Bootstrap js-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script></body>
</body>
</html>