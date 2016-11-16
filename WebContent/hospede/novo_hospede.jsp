<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Cadastro de Hospede</title>
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
	<h1>Cadastrar Hospede</h1>
	<hr/>
	<form method="POST" action="novo_hospede">
		<table>
			<tr>
				<td><label for="usr">Nome: </label></td>
				<td><input class="form-control" type="text" name="nome" required="required"></td>
			</tr>
			<tr>
				<td><label for="usr">CPF: </label></td>
				<td><input class="form-control" type="text" name="cpf" required="required"></td>
			</tr>
			<tr>
				<td><label for="usr">E-mail: </label></td>
				<td><input class="form-control" type="text" name="email" required="required"></td>
			</tr>
			<tr>
				<td><label for="usr">Telefone: </label></td>
				<td><input class="form-control" type="text" name="telefone" required="required"></td>
			</tr>
			<tr>
				<td><label for="usr">Rua: </label></td>
				<td><input class="form-control" type="text" name="logradouro" required="required"></td>
				<td><input style="width:50%;" class="form-control" type="number" name="numero" required="required" placeholder="Número" /></td>
			</tr>
			<tr>
				<td><label for="usr">Bairro: </label></td>
				<td><input class="form-control" type="text" name="bairro" required="required"></td>
			</tr>
			<tr>
				<td><label for="usr">Cidade: </label></td>
				<td><input class="form-control" type="text" name="cidade" required="required"></td>
			</tr>
			<tr>
				<td><label for="usr">CEP: </label></td>
				<td><input class="form-control" type="text" name="cep" required="required"></td>
			</tr>
			<tr>
				<td><input class="btn btn-success" type="submit" value="Cadastrar"/></td>
				<td><a class="btn btn-default" href="listagem_hospedes"><b>Voltar</b></a></td>
			</tr>
		</table>
	</form>
</body>
</html>