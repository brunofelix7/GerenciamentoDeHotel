-- BANCO DE DADOS
CREATE DATABASE db_hotel;
USE db_hotel;

-- USUÁRIO ADMIN
INSERT INTO usuario(login, senha) VALUES('admin', 'admin');

-- FUNCIONÁRIO QUE POSSUI O USUÁRIO ADMIN
INSERT INTO pessoa(DTYPE, cpf, email, bairro, cep, cidade, logradouro, numero, nome, telefone, ctps, matricula, usuario_id) 
VALUES ('Funcionario', '06807051245', 'funcionario@gmail.com', 'Bancarios', '58012365', 'Joao Pessoa', 'Av. Sergio Guerra', '774', 'Bruno', '32321515', '00015488', '1510009854', 1);

-- PRÉ CADASTRO DE CATEGORIAS
INSERT INTO categoria (capacidade, descricao, nome, valor) VALUES (1, 'Teste', 'Simples', 100);
INSERT INTO categoria (capacidade, descricao, nome, valor) VALUES (2, 'Teste', 'Duplo', 150);
INSERT INTO categoria (capacidade, descricao, nome, valor) VALUES (3, 'Teste', 'Triplo', 200);