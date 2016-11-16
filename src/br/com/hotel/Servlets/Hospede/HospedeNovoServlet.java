package br.com.hotel.Servlets.Hospede;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.SystemException;
import br.com.hotel.Entity.Endereco;
import br.com.hotel.Entity.Hospede;
import br.com.hotel.Service.HospedeService;

@WebServlet("/novo_hospede")
@SuppressWarnings("serial")
public class HospedeNovoServlet extends HttpServlet {
	
	private Hospede hospede;
	private Endereco endereco;
	private HospedeService hospedeService;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		request.getRequestDispatcher("hospede/novo_hospede.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//	Recuperando parâmetros
		String nome = request.getParameter("nome");
		String cpf = request.getParameter("cpf");
		String email = request.getParameter("email");
		String contato = request.getParameter("telefone");
		String rua = request.getParameter("logradouro");
		int numero = Integer.parseInt(request.getParameter("numero"));
		String bairro = request.getParameter("bairro");
		String cidade = request.getParameter("cidade");
		String cep = request.getParameter("cep");
		
		//	Validação
		
		try{
			//	Instanciando objetos
			hospede = new Hospede();
			endereco = new Endereco();
			hospedeService = new HospedeService();
			
			//	Atribuindo valores
			hospede.setNome(nome);
			hospede.setCpf(cpf);
			hospede.setEmail(email);
			hospede.setTelefone(contato);
			endereco.setLogradouro(rua);
			endereco.setNumero(numero);
			endereco.setBairro(bairro);
			endereco.setCidade(cidade);
			endereco.setCep(cep);
			hospede.setEndereco(endereco);
			
			//	Persistindo dados
			hospedeService.salvar(hospede);
			
			//	Redirecionando para tela de listagem de hospedes
			response.sendRedirect("listagem_hospedes");
			
		}catch(SystemException erro){
			erro.printStackTrace();
		}
		
	}

}
