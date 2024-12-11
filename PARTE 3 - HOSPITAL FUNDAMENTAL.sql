USE hospital;

-- Inserindo dados na tabela de especialidades
INSERT INTO `especialidade` (`descricao`) VALUES 
('oncologia'), 
('endocrinologia'), 
('reumatologia'), 
('urologia'), 
('hematologia'), 
('oftalmologia'), 
('nefrologia');

-- Inserindo dados na tabela de médicos
INSERT INTO `medico` (`nome_medico`, `cpf_medico`, `telefone_medico`) VALUES  
('Dr. Gabriel Souza', '98765432100', '54321'),
('Dr. Larissa Mendes', '87654321099', '65432'),
('Dr. Rafael Costa', '76543210988', '76543'),
('Dr. Vanessa Rodrigues', '65432109877', '87654'),
('Dr. Felipe Almeida', '54321098766', '98765'),
('Dr. Camila Martins', '43210987655', '09876'),
('Dr. Ricardo Lima', '32109876544', '10987'),
('Dr. Julia Santos', '21098765433', '21098'),
('Dr. Thiago Nogueira', '10987654322', '32109'),
('Dr. Beatriz Oliveira', '01987654321', '43210');

-- Inserindo dados na tabela de pacientes
INSERT INTO `paciente` (`nome_paciente`, `data_nascimento_paciente`, `endereço_paciente`, `email_paciente`, `cpf_paciente`, `rg_paciente`) VALUES  
('Fernando Costa', '1980-02-12', 'Rua X, 101', 'fernando.costa@gmail.com', '11223344550', '55667788'),
('Isabela Santos', '1992-07-21', 'Rua Y, 102', 'isabela.santos@gmail.com', '22334455661', '66778899'),
('Marcelo Nunes', '1987-03-30', 'Rua Z, 103', 'marcelo.nunes@gmail.com', '33445566772', '77889900'),
('Carolina Dias', '1991-09-10', 'Rua W, 104', 'carolina.dias@gmail.com', '44556677883', '88990011'),
('Gabriel Monteiro', '1985-05-18', 'Rua V, 105', 'gabriel.monteiro@gmail.com', '55667788994', '99001122'),
('Amanda Ramos', '1979-08-25', 'Rua U, 106', 'amanda.ramos@gmail.com', '66778899005', '00112233'),
('Rodrigo Teixeira', '1994-01-15', 'Rua T, 107', 'rodrigo.teixeira@gmail.com', '77889900116', '11223344'),
('Priscila Vieira', '1983-06-05', 'Rua S, 108', 'priscila.vieira@gmail.com', '88990011227', '22334455'),
('Victor Andrade', '1990-04-12', 'Rua R, 109', 'victor.andrade@gmail.com', '99001122338', '33445566'),
('Lara Martins', '1988-11-30', 'Rua Q, 110', 'lara.martins@gmail.com', '00112233449', '44556677'),
('João Henrique', '1977-02-18', 'Rua P, 111', 'joao.henrique@gmail.com', '11223344550', '55667788'),
('Camila Barbosa', '1993-12-01', 'Rua O, 112', 'camila.barbosa@gmail.com', '22334455661', '66778899'),
('Fábio Alves', '1989-10-25', 'Rua N, 113', 'fabio.alves@gmail.com', '33445566772', '77889900'),
('Bruna Silva', '1986-07-10', 'Rua M, 114', 'bruna.silva@gmail.com', '44556677883', '88990011'),
('Leonardo Sousa', '1995-03-09', 'Rua L, 115', 'leonardo.sousa@gmail.com', '55667788994', '99001122');

-- Inserindo dados na tabela de consultas
INSERT INTO consulta (data_marcada, hora_de_realizacao, valor_da_consulta, id_medico, id_paciente) VALUES
('2023-01-01', '09:00:00', 250.00, 1, 1),
('2023-02-02', '10:00:00', 300.00, 2, 2),
('2023-03-03', '11:00:00', 350.00, 3, 3),
('2023-04-04', '12:00:00', 400.00, 4, 4),
('2023-05-05', '13:00:00', 450.00, 5, 5),
('2023-06-06', '14:00:00', 500.00, 6, 6),
('2023-07-07', '15:00:00', 550.00, 7, 7),
('2023-08-08', '16:00:00', 600.00, 8, 8),
('2023-09-09', '17:00:00', 650.00, 9, 9),
('2023-10-10', '18:00:00', 700.00, 10, 10);

-- Inserindo dados na tabela de convênios
INSERT INTO convenio (nome_convenio, cnpj_convenio, tempo_carencia, numero_da_carteira_do_convenio, id_paciente) VALUES
('Porto Seguro', 98765432000123, 30, 2001, 1),
('SulAmérica', 87654321000134, 60, 2002, 2),
('Amil', 76543210000145, 90, 2003, 3),
('Hapvida', 65432100000156, 30, 2004, 4);

-- Inserindo dados na tabela de quartos
INSERT INTO `quartos` (numero_do_quarto, descricao_do_quarto, valor_diaria, tipo_do_quarto) VALUES 
(401, 'Suíte 1', 400.00, 'suite'),
(402, 'Suíte 2', 450.00, 'suite'),
(501, 'Quarto Triplo 1', 200.00, 'quarto_triplo'),
(502, 'Quarto Triplo 2', 250.00, 'quarto_triplo'),
(601, 'Enfermaria 4', 100.00, 'enfermagem'),
(602, 'Enfermaria 5', 110.00, 'enfermagem'),
(603, 'Enfermaria 6', 120.00, 'enfermagem');

-- Inserindo dados na tabela de internação
INSERT INTO `internacao` (data_de_entrada, data_prevista_de_alta, data_da_alta, descricao_do_procedimento, id_paciente, id_medico, id_quarto) VALUES
('2023-03-01', '2023-03-05', '2023-03-04', 'Colecistectomia', 1, 1, 1),
('2023-06-10', '2023-06-15', '2023-06-14', 'Fratura de braço', 2, 2, 3),
('2023-09-20', '2023-09-25', '2023-09-24', 'Infecção pulmonar', 3, 3, 2),
('2023-12-15', '2023-12-20', '2023-12-19', 'Cirurgia cardíaca', 4, 4, 1);

-- Inserindo dados na tabela de receitas
INSERT INTO receita (medicamentos_usados, quantidade_de_medicamentos, instrucoes_de_uso_dos_medicamentos, id_consulta, id_medico) VALUES
('Diclofenaco, Azitromicina', 2, 'Tomar após as refeições', 1, 1),
('Clonazepam, Ranitidina', 2, 'Tomar antes de dormir', 2, 2),
('Prednisona, Metronidazol', 2, 'Tomar com alimentos', 3, 3),
('Furosemida, Enalapril', 2, 'Tomar pela manhã', 4, 4);
