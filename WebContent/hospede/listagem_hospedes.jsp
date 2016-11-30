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
	
	<!-- jQuery -->
    <script src="assets/js/jquery-3.1.1.min.js"></script>
    
    <!-- Bootstrap 3.3.7 (JavaScript) -->
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/main.js"></script>
    
	<!-- Bootstrap 3.3.7 (CSS) -->
	<link rel="stylesheet" href="assets/css/bootstrap.css"/>
	<link rel="stylesheet" href="assets/css/bootstrap-theme.min.css"/>
	<link rel="stylesheet" href="assets/css/main.css"/>
	
	<!-- Modernizr -->
    <script src="assets/js/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    
    <!-- jQuery UI -->
    <link rel="stylesheet" href="assets/css/jquery-ui.min.css" /> 
    <link rel="stylesheet" href="assets/css/jquery-ui.theme.min.css" />
    <script src="assets/js/jquery-ui.min.js"></script>
    
    <!-- SweetAlert2 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/sweetalert2/6.1.1/sweetalert2.min.css"/>
	
	<!-- Outros -->
	<link rel="stylesheet" href="assets/css/estilo.css"/>
	
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
			swal({
				  title: 'Você tem certeza?',
				  text: "Essa ação não poderá ser revertida!",
				  type: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#4CAF50',
				  cancelButtonColor: '#F44336',
				  confirmButtonText: 'Confirmar',
				  cancelButtonText: 'Cancelar'
				}).then(function () {
					window.location = "remover_hospede?id=" + id;
				  swal(
				    'Removido!',
				    'O registro foi excluído com sucesso.',
				    'success'
				  )
				})
		}
	</script>
</head>
<body>

	<h1>Listagem de Hospedes</h1>
	<hr/>

	<!-- MENU -->
	<ul class="nav nav-pills">
		<li role="presentation" class="active"><a style="background-color: #455A64;" href="/GerenciamentoDeHotel">Home</a></li>
		<li role="presentation"><a style="color: #455A64;" href="#">Categorias</a></li>
		<li role="presentation"><a style="color: #455A64;" href="listagem_quartos">Quartos</a></li>
		<li role="presentation"><a style="color: #455A64;" href="listagem_hospedes">Hospedes</a></li>
		<li role="presentation"><a style="color: #455A64;" href="listagem_reservas">Reservas</a></li>
		<li role="presentation"><a style="color: #455A64;" href="#">Disponibilidade</a></li>
		<li role="presentation" class="active"><a style="background-color: #F44336;" href="login?msg=logoff">Logout</a></li>
	</ul>
	<br/>
	<br/>
	
	<!-- PESQUISA -->
	<form action="pesquisar_hospede" method="GET">
		<table>
			<tr>
				<td><input class="form-control" type="text" name="nome" placeholder="Nome" /></td>
				<td><input class="btn btn-default" type="submit" value="Pesquisar"/></td>
			</tr>
		</table>
	</form>
	<form action="pesquisar_hospede" method="GET">
		<table>
			<tr>
				<td><input class="form-control" type="text" name="cpf" placeholder="CPF" /></td>
				<td><input class="btn btn-default" type="submit" value="Pesquisar"/></td>
			</tr>
		</table>
	</form>
	<br/>
	
	<!-- CADASTRAR NOVO -->
	<a href='novo_hospede' style="background-color: #455A64; border: 0px;" class="btn btn-primary"><span class="glyphicon glyphicon-plus-sign"></span> Novo hospede</span></a>
	<br/><br/>

	<!-- LISTAGEM -->
	<table class="table table-hover table-bordered table-striped table-condensed" width="100%">
		<thead bgcolor="#263238">
			<tr>
				<td><b style="color: #ffffff;">#</b></td>
				<td><b style="color: #ffffff;">Nome</b></td>
				<td><b style="color: #ffffff;">CPF</b></td>
				<td><b style="color: #ffffff;">E-mail</b></td>
				<td><b style="color: #ffffff;">Contato</b></td>
				<td><b style="color: #ffffff;">Ações</b></td>
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
					
					<td>
						<div class="btn-group" role="group" aria-label="...">
							<a class="btn btn-sm btn-primary" href="visualizar_hospede?id=<%= h.getId() %>"><span class="glyphicon glyphicon-search"></span></a>
							<a class="btn btn-sm btn-primary" href="editar_hospede?id=<%= h.getId() %>"><span class="glyphicon glyphicon-pencil"></span></a>
							<a class="btn btn-sm btn-danger" href="#" onclick="apagar('<%= h.getId() %>')"><span class="glyphicon glyphicon-remove"></span></a>
						</div>
					</td>
				</tr>
			<%		
				}
			%>
		</tbody>
	</table>

<!-- SeetAlert2 -->
<script src="https://cdn.jsdelivr.net/sweetalert2/6.1.1/sweetalert2.min.js"></script>
</body>
</html>