ALTER TABLE `medico` ADD COLUMN `status` BOOLEAN NOT NULL DEFAULT TRUE;

-- Atualizando os médicos para definir se estão ativos ou inativos
UPDATE `medico`
SET `status` = FALSE
WHERE `codigo_medico` IN (1, 3); -- Definindo os médicos com códigos 1 e 3 como inativos

UPDATE `medico`
SET `status` = TRUE
WHERE `codigo_medico` NOT IN (1, 3); -- Definindo todos os outros médicos como ativos
