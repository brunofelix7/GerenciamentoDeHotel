<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.com.hotel.Entity.Quarto" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Listagem de Quartos</title>
	<style type="text/css">
		<%@ include file="/assets/css/bootstrap.css" %>
	  	<%@ include file="/assets/css/estilo.css" %>
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
	<table width="50%">
		<tr>
			<td>
				<div class="btn-group btn-group-justified" role="group" aria-label="...">
				<div class="btn-group" role="group">
					<a href="#" class="btn btn-primary">Categorias</a>
				</div>
				<div class="btn-group" role="group">
					<a href="listagem_quartos" class="btn btn-primary">Quartos</a>
				</div>
				<div class="btn-group" role="group">
				    <a href="listagem_hospedes" class="btn btn-primary">Hospedes</a>
				</div>
				<div class="btn-group" role="group">
				    <a href="listagem_reservas" class="btn btn-primary">Reservas</a>
				</div>
				<div class="btn-group" role="group">
				    <a href="#" class="btn btn-primary">Disponibilidade</a>
				</div>
				<td>
					<div class="btn-group" role="group">
					    <a href="login?msg=logoff" class="btn btn-danger">Logout</a>
					</div>
				</td>
				</div>
			</td>
		</tr>
	</table>
	<br/>
	
	<!-- PESQUISA -->
	<table>
		<tr>
			<td><input class="form-control" type="text" name="pesquisa" placeholder="Nome" /></td>
			<td>
				<select class="form-control" name="categoria" required="required">
					<option value="" label="-- Selecione --"></option>
					<option value="Simples" label="Simples"></option>
					<option value="Duplo" label="Duplo"></option>
					<option value="Triplo" label="Triplo"></option>
				</select>
			</td>
			<td><input class="btn btn-default" type="submit" name="pesquisar" value="Pesquisar"/></td>
		</tr>
	</table>
	<br/>
	
	<!-- CADASTRAR NOVO -->
	<a href='novo_quarto' class="btn btn-success">Novo</span></a>
	<br/><br/>

	<!-- LISTAGEM -->
	<table class="table" width="100%">
		<thead>
			<tr>
				<td><b>Código</b></td>
				<td><b>Número</b></td>
				<td><b>Andar</b></td>
				<td><b>Categoria</b></td>
				<td><b>Editar</b></td>
				<td><b>Remover</b></td>
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
					<td><a class="btn btn-warning" href="editar_quarto?id=<%= q.getId() %>">Editar</a></td>
					<td><a class="btn btn-danger" href="#" onclick="apagar('<%= q.getId() %>')">Excluir</a></td>
				</tr>
			<%		
				}
			%>
		</tbody>
	</table>
</body>
</html>