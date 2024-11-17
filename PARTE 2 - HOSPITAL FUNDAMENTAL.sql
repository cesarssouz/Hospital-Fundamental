CREATE DATABASE IF NOT EXISTS hospital;

USE hospital;

CREATE TABLE IF NOT EXISTS medico (
cpf_medico VARCHAR(12) PRIMARY KEY NOT NULL,
rg_medico VARCHAR (12),
nome_medico VARCHAR(500),
data_de_nascimento_medico DATE NOT NULL,
endereço_medico VARCHAR(50),
telefone_medico VARCHAR(12),
email_medico VARCHAR(80)
);

CREATE TABLE IF NOT EXISTS especialidade(
id_especialidade SERIAL PRIMARY KEY,
nome_especialidade VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS paciente(
cpf_paciente VARCHAR(12) PRIMARY KEY NOT NULL,
rg_paciente VARCHAR(12),
nome_paciente VARCHAR(500),
data_de_nascimento_paciente DATE NOT NULL, 
endereço_paciente VARCHAR(50),
telefone_paciente VARCHAR(12),
email_paciente VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS quartos(
numero_do_quarto INT NOT NULL,
descricao_do_quarto VARCHAR(200) NOT NULL,
valor_diaria FLOAT(10) NOT NULL,
tipo_do_quarto ENUM("Apartamento" , "Quarto duplo" , "Enfermagem" ) NOT NULL, 
PRIMARY KEY (numero_do_quarto)
);

CREATE TABLE IF NOT EXISTS internacao(
id_internacao INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY, 
data_internacao DATE NOT NULL, 
data_prevista_alta DATE NOT NULL,
data_alta DATE NOT NULL, 
procedimento VARCHAR (600) NOT NULL, 
id_paciente INT NOT NULL,
id_medico INT NOT NULL, 
id_quarto INT NOT NULL
);

CREATE TABLE IF NOT EXISTS enfermeiro (
id_enfermeiro INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY, 
nome_enfermeiro VARCHAR (500) NOT NULL, 
cpf_enfermeiro VARCHAR (12) NOT NULL UNIQUE, 
registro_de_enfermagem VARCHAR (50) NOT NULL UNIQUE

);

CREATE TABLE IF NOT EXISTS internacao_enfermeiro (
id_internacao INT NOT NULL,
id_enfermeiro INT NOT NULL,
PRIMARY KEY (id_internacao, id_enfermeiro )
);

CREATE TABLE IF NOT EXISTS consultas (
id_consulta INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY ,
data_marcada DATE NOT NULL,
hora_realizada TIME NOT NULL,
valor_da_consulta FLOAT(15) NOT NULL, 
id_medico INT NOT NULL,
id_paciente INT NOT NULL
);

CREATE TABLE IF NOT EXISTS convenio (
nome_convenio VARCHAR(200) NOT NULL,
cnpj_convenio VARCHAR(20) NOT NULL,
tempo_carencia INT NOT NULL,
numero_carteira_convenio INT NOT NULL UNIQUE, 
id_paciente INT,
id_medico INT
);

CREATE TABLE IF NOT EXISTS receitas (
id_receita INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
medicamentos TEXT NOT NULL,
quantidade_medicamentos INT NOT NULL,
instrucoes_medicamentos  VARCHAR(500) NOT NULL, 
id_consulta INT NOT NULL,
id_medico INT NOT NULL
);