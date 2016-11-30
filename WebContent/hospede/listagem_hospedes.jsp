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
	<link rel="stylesheet" href="assets/css/estilo.css"/>
	<link rel="stylesheet" href="assets/css/bootstrap.css"/>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/sweetalert2/6.1.1/sweetalert2.min.css"/>
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
	<table class="table-striped" width="100%">
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
							<a style="border-radius: 0px; background-color: #455A64; border: 0px;" class="btn btn-primary" href="editar_hospede?id=<%= h.getId() %>"><span class="glyphicon glyphicon-pencil"></span></a>
							<a style="border-radius: 0px; background-color: #455A64; border: 0px;" class="btn btn-primary" href="visualizar_hospede?id=<%= h.getId() %>"><span class="glyphicon glyphicon-eye-open"></span></a>
							<a style="border-radius: 0px; background-color: #F44336; border: 0px;" class="btn btn-danger" href="#" onclick="apagar('<%= h.getId() %>')"><span class="glyphicon glyphicon-remove-sign"></span></a>
						</div>
					</td>
				</tr>
			<%		
				}
			%>
		</tbody>
	</table>
<!-- jQuery / Bootstrap JavaScript-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/sweetalert2/6.1.1/sweetalert2.min.js"></script>
</body>
</html>