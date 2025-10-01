-- SANITY CHECK DIM VENDEDORES
SELECT * FROM dim_vendedores_transformada 
-- Verificando a possibilidade de valores nulos
SELECT
    SUM(CASE WHEN id_vendedor IS NULL THEN 1 ELSE 0 END) AS nulos_id_vendedor,
    SUM(CASE WHEN nome_vendedor IS NULL THEN 1 ELSE 0 END) AS nulos_nome_vendedor,
    SUM(CASE WHEN regiao_vendas IS NULL THEN 1 ELSE 0 END) AS nulos_regiao_vendas,
    SUM(CASE WHEN data_admissao IS NULL THEN 1 ELSE 0 END) AS nulos_data_admissao
from dim_vendedores_transformada;

Select
    id_vendedor
from dim_vendedores_transformada
where id_vendedor = 0;
-- Verificando a possibilidade de valores duplicados
SELECT 
    id_vendedor,
    COUNT(*) AS quantidade
FROM dim_vendedores_transformada
GROUP BY id_vendedor
HAVING COUNT(*) > 1;
-- OK NAO EXISTEM

-- Verificando a distribuição dos dados qualitativos se está padronizado
-- Primeiro, a variável NOME VENDEDOR
SELECT
 nome_vendedor,
    COUNT(*) AS quantidade
FROM dim_vendedores_transformada
GROUP BY nome_vendedor
ORDER BY nome_vendedor DESC;
-- Segundo, a variável REGIAO_VENDAS
SELECT
     regiao_vendas,
    COUNT(*) AS quantidade
FROM dim_vendedores_transformada
GROUP BY regiao_vendas
ORDER BY quantidade DESC;

-- Terceiro, a variável DATA ADMISSAO
SELECT
    data_admissao,
    COUNT(*) AS quantidade
FROM dim_vendedores_transformada
GROUP BY data_admissao
ORDER BY quantidade DESC;

-- Quarto, a variável LINHA PRODUTO
SELECT
    linha_produto,
    COUNT(*) AS quantidade
FROM dim_vendedores_transformada
GROUP BY linha_produto
ORDER BY quantidade DESC;


-- como na tabela fato tem id_vendedores =0, então vamos inserir quando id_vendedores = 0 ,então inserir um vendedor chamado "VENDEDOR NÃO IDENTIFICADO" para não perder essas vendas
INSERT INTO dim_vendedores_transformada (id_vendedor, nome_vendedor, regiao_vendas, data_admissao)
VALUES (0, 'Não informado', 'Desconhecido', '1900-01-01');

-- Confirmando, se foi inserido
Select
    *
from dim_vendedores_transformada
where id_vendedor = 0;
-- ok