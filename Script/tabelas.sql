-- #1. Criação do Banco de Dados
CREATE DATABASE Mercados_Joca;
USE Mercados_Joca;

-- #2. Criação de todas as tabelas
CREATE TABLE Fornecedores(
	id_fornecedor	INT,
    nome VARCHAR(100)
);
CREATE TABLE Contato(
	id_contato	INT,
    telefone	VARCHAR(12),
    endereco	VARCHAR(50),
    email		VARCHAR(50)
);

CREATE TABLE Ativos(
	id_ativos		INT,
    alugueis		DECIMAL(5,2),
    veiculos		VARCHAR(30),
    equipamentos	VARCHAR(30)
);
CREATE TABLE Despesas(
	id_despesas		INT,
    agua			DECIMAL(5,2),
    energia			DECIMAL(5,2),
    perdas			DECIMAL(5,2)
);

CREATE TABLE Gerencia(
	id_gerente		INT,
    nome_gerente	VARCHAR(100),
    regional		VARCHAR(50)
);

CREATE TABLE Funcionarios(
	id_funcionarios		INT,
    nome_funcionario	VARCHAR(100),
    funcao 				VARCHAR(50),
    salario				DECIMAL(5,2),
    data_admissao		DATE
);
CREATE TABLE Produtos(
	id_produto	INT,
    nome		VARCHAR(50),
    valor		DECIMAL(5,2),
    custo		DECIMAL(5,2),
    lucro		DECIMAL(5,2),
    remessa		DATE,
    qnd_estoque	INT
);
-- #RELACIONAMENTO N:N entre Funcionarios e Produtos
CREATE TABLE Funcionarios_Produtos(
	id_funcionarios		INT,
    id_produto			INT
);



-- #3. Definições das keys para ser coerente com os relacionamentos

-- #Gerencia
ALTER TABLE Gerencia
ADD PRIMARY KEY (id_gerente);

-- #Custos 
ALTER TABLE custos
ADD PRIMARY KEY (id_custos);

-- #Contato
ALTER TABLE Contato
ADD PRIMARY KEY (id_contato);
-- #Fornecedores
ALTER TABLE Fornecedores
ADD PRIMARY KEY (id_fornecedor);

-- #Funcionarios
ALTER TABLE Funcionarios
ADD PRIMARY KEY (id_funcionarios);

-- #Produtos
ALTER TABLE Produtos
ADD PRIMARY KEY (id_produto);

-- #4. Trazendo Foreign keys

-- #Despesas
ALTER TABLE despesas
ADD CONSTRAINT fk_custos
FOREIGN KEY (id_despesas)
REFERENCES custos(id_custos);

-- #Fornecedores
ALTER TABLE Fornecedores
ADD CONSTRAINT fk_contato
FOREIGN KEY (id_contato)
REFERENCES contato(id_contato);

