-- 1. Todos os dados e o valor médio das consultas do ano de 2020
SELECT 
    consulta.codigo_consulta, 
    consulta.codigo_medico, 
    consulta.codigo_paciente, 
    consulta.data_agendada, 
    consulta.valor,
    AVG(consulta.valor) OVER () AS valor_medio_consultas
FROM consulta
WHERE YEAR(consulta.data_agendada) = 2020;

-- X. Todos os dados e o valor médio das consultas feitas sob convênio
SELECT 
    consulta.codigo_consulta, 
    consulta.codigo_medico, 
    consulta.codigo_paciente, 
    consulta.data_agendada, 
    consulta.valor,
    AVG(consulta.valor) OVER () AS valor_medio_consultas_convenio
FROM consulta
JOIN convenio ON consulta.codigo_paciente = convenio.codigo_paciente;

-- 2. Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta
SELECT 
    internacao.codigo_internacao,
    internacao.data_entrada, 
    internacao.data_prevista_alta, 
    internacao.data_alta, 
    internacao.procedimento, 
    internacao.codigo_paciente, 
    internacao.codigo_medico, 
    internacao.codigo_quarto
FROM internacao
WHERE internacao.data_alta > internacao.data_prevista_alta;

-- 3. Receituário completo da primeira consulta registrada com receituário associado
SELECT 
    receita.codigo_receita, 
    receita.medicamentos, 
    receita.quantidade_medicamentos, 
    receita.instrucoes_uso, 
    consulta.codigo_consulta, 
    consulta.data_agendada, 
    consulta.codigo_medico
FROM receita
JOIN consulta ON receita.codigo_consulta = consulta.codigo_consulta
ORDER BY consulta.data_agendada
LIMIT 1;

-- 4. Todos os dados da consulta de maior valor e também da de menor valor (ambas não realizadas sob convênio)
SELECT 
    consulta.codigo_consulta, 
    consulta.codigo_medico, 
    consulta.codigo_paciente, 
    consulta.data_agendada, 
    consulta.valor
FROM consulta
WHERE consulta.codigo_consulta = (
    SELECT codigo_consulta
    FROM consulta
    WHERE valor = (
        SELECT MAX(valor)
        FROM consulta
        WHERE codigo_paciente NOT IN (SELECT codigo_paciente FROM convenio)
    )
    LIMIT 1
)
OR consulta.codigo_consulta = (
    SELECT codigo_consulta
    FROM consulta
    WHERE valor = (
        SELECT MIN(valor)
        FROM consulta
        WHERE codigo_paciente NOT IN (SELECT codigo_paciente FROM convenio)
    )
    LIMIT 1
);

-- 5. Todos os dados das internações em seus respectivos quartos, calculando o total da internação
SELECT 
    internacao.data_entrada, 
    internacao.procedimento, 
    quarto.numero_quarto
FROM internacao
JOIN quarto ON internacao.codigo_quarto = quarto.codigo_quarto
WHERE quarto.tipo = 'apartamento';

-- 6. Data, procedimento e número de quarto de internações em quartos do tipo "apartamento"
SELECT 
    internacao.data_entrada, 
    internacao.procedimento, 
    quarto.numero_quarto
FROM internacao
JOIN quarto ON internacao.codigo_quarto = quarto.codigo_quarto
WHERE quarto.tipo = 'apartamento';

-- 7. Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram menores de 18 anos
SELECT 
    paciente.nome AS nome_paciente,
    consulta.data_agendada, 
    especialidade.descricao AS especialidade
FROM consulta
JOIN paciente ON consulta.codigo_paciente = paciente.codigo_paciente
JOIN medico ON consulta.codigo_medico = medico.codigo_medico
JOIN medico_especialidade ON medico.codigo_medico = medico_especialidade.codigo_medico
JOIN especialidade ON medico_especialidade.codigo_especialidade = especialidade.codigo_especialidade
WHERE TIMESTAMPDIFF(YEAR, paciente.data_nascimento, consulta.data_agendada) < 18
AND especialidade.descricao != 'pediatria'
ORDER BY consulta.data_agendada;

-- 8. Nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas por médicos da especialidade “gastroenterologia”
SELECT 
    paciente.nome AS nome_paciente,
    medico.nome AS nome_medico,
    internacao.data_entrada,
    internacao.procedimento
FROM internacao
JOIN paciente ON internacao.codigo_paciente = paciente.codigo_paciente
JOIN medico ON internacao.codigo_medico = medico.codigo_medico
JOIN medico_especialidade ON medico.codigo_medico = medico_especialidade.codigo_medico
JOIN especialidade ON medico_especialidade.codigo_especialidade = especialidade.codigo_especialidade
JOIN quarto ON internacao.codigo_quarto = quarto.codigo_quarto
WHERE especialidade.descricao = 'gastroenterologia'
AND quarto.tipo = 'enfermaria';

-- 9. Os nomes dos médicos, seus CRMs e a quantidade de consultas que cada um realizou
SELECT 
    medico.nome AS nome_medico,
    medico.crm,
    COUNT(consulta.codigo_consulta) AS quantidade_consultas
FROM medico
JOIN consulta ON consulta.codigo_medico = medico.codigo_medico
GROUP BY medico.codigo_medico;

-- 10. Todos os médicos que tenham "Gabriel" no nome
SELECT 
    medico.nome, 
    medico.crm
FROM medico
WHERE medico.nome LIKE '%Gabriel%';

-- 11. Os nomes, CREs e número de internações de enfermeiros que participaram de mais de uma internação.
SELECT 
    enfermeiro.nome AS nome_enfermeiro, 
    enfermeiro.cre,
    COUNT(internacao_enfermeiro.codigo_internacao) AS numero_internacoes
FROM enfermeiro
JOIN internacao_enfermeiro ON enfermeiro.codigo_enfermeiro = internacao_enfermeiro.codigo_enfermeiro
JOIN internacao ON internacao_enfermeiro.codigo_internacao = internacao.codigo_internacao
GROUP BY enfermeiro.codigo_enfermeiro
HAVING COUNT(internacao_enfermeiro.codigo_internacao) > 1;
