<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.com.hotel.Entity.Hospede" %>
<%@ page import="br.com.hotel.Entity.Endereco" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Atualizar registro de hospede</title>
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
		Hospede hospede = (Hospede) request.getAttribute("hospede");
	%>

	<h1>Atualizar registro</h1>
	<hr/>
	<form method="POST" action="editar_hospede">
		<table>
			<tr>
				<td><label for="usr">Código:</label></td>
				<td><input class="form-control" type="text" name="id" readonly="readonly" value=<%=hospede.getId()%>></td>
			</tr>
			<tr>
				<td><label for="usr">Nome:</label></td>
				<td><input class="form-control" type="text" name="nome" required="required" value=<%=hospede.getNome()%>></td>
			</tr>
			<tr>
				<td><label for="usr">CPF:</label></td>
				<td><input class="form-control" type="text" name="cpf" required="required" value=<%=hospede.getCpf()%>></td>
			</tr>
			<tr>
				<td><label for="usr">E-mail:</label></td>
				<td><input class="form-control" type="text" name="email" required="required" value=<%=hospede.getEmail()%>></td>
			</tr>
			<tr>
				<td><label for="usr">Telefone:</label></td>
				<td><input class="form-control" type="text" name="telefone" required="required" value=<%=hospede.getTelefone()%>></td>
			</tr>
			<tr>
				<td><label for="usr">Rua:</label></td>
				<td><input class="form-control" type="text" name="logradouro" required="required" value=<%=hospede.getEndereco().getLogradouro()%>></td>
				<td><input class="form-control" style="width:50%;" class="form-control" type="number" name="numero" required="required" value=<%=hospede.getEndereco().getNumero()%>></td>
			</tr>
			<tr>
				<td><label for="usr">Bairro:</label></td>
				<td><input class="form-control" type="text" name="bairro" required="required" value=<%=hospede.getEndereco().getBairro()%>></td>
			</tr>
			<tr>
				<td><label for="usr">Cidade:</label></td>
				<td><input class="form-control" type="text" name="cidade" required="required" value=<%=hospede.getEndereco().getCidade()%>></td>
			</tr>
			<tr>
				<td><label for="usr">CEP:</label></td>
				<td><input class="form-control" type="text" name="cep" required="required" value=<%=hospede.getEndereco().getCep()%>></td>
			</tr>
			<tr>
				<td><input class="btn btn-success" type="submit" value="Atualizar"/></td>
				<td><a class="btn btn-default" href="listagem_hospedes"><b>Voltar</b></a></td>
			</tr>
		</table>
	</form>
</body>
</html>