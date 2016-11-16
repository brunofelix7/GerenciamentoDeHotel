<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.com.hotel.Entity.Hospede" %>
<%@ page import="br.com.hotel.Service.HospedeService"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Listagem de Hospedes</title>
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
				window.location = "remover_hospede?id=" + id;
			}
		}
	</script>
</head>
<body>

	<h1>Listagem de Hospedes</h1>
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
			<td><input class="btn btn-default" type="submit" name="pesquisar" value="Pesquisar"/></td>
		</tr>
		<tr>
			<td><input class="form-control" type="text" name="pesquisa" placeholder="CPF" /></td>
			<td><input class="btn btn-default" type="submit" name="pesquisar" value="Pesquisar"/></td>
		</tr>
	</table>
	<br/>
	
	<!-- CADASTRAR NOVO -->
	<a href='novo_hospede' class="btn btn-success">Novo</span></a>
	<br/><br/>

	<!-- LISTAGEM -->
	<table class="table" width="100%">
		<thead>
			<tr>
				<td><b>Código</b></td>
				<td><b>Nome</b></td>
				<td><b>CPF</b></td>
				<td><b>E-mail</b></td>
				<td><b>Contato</b></td>
				<td><b>Editar</b></td>
				<td><b>Remover</b></td>
				<td><b>Visualizar</b></td>
			</tr>
		</thead>
		<tbody>
			<% 
				List<Hospede> hospedes = new ArrayList<Hospede>();
				hospedes = (List<Hospede>) request.getAttribute("hospedes"); 
			%>
			<% for(Hospede h: hospedes){ %>
				<tr>
					<td><%= h.getId() %></td>
					<td><%= h.getNome() %></td>
					<td><%= h.getCpf() %></td>
					<td><%= h.getEmail() %></td>
					<td><%= h.getTelefone() %></td>
					<td><a class="btn btn-warning" href="editar_hospede?id=<%= h.getId() %>">Editar</a></td>
					<td><a class="btn btn-danger" href="#" onclick="apagar('<%= h.getId() %>')">Excluir</a></td>
					<td><a class="btn btn-info" href="visualizar_hospede?id=<%= h.getId() %>">Detalhar</a></td>					
				</tr>
			<%		
				}
			%>
		</tbody>
	</table>
</body>
</html>