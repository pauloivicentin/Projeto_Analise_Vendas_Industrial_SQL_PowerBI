-- SANITY CHECK DIM CLIENTES
SELECT * FROM dim_clientes_transformada LIMIT 5;
-- Verificando a possibilidade de valores nulos
SELECT
    SUM(CASE WHEN id_cliente IS NULL THEN 1 ELSE 0 END) AS nulos_id_cliente,
    SUM(CASE WHEN nome_cliente IS NULL THEN 1 ELSE 0 END) AS nulos_nome_cliente,
    SUM(CASE WHEN segmento IS NULL THEN 1 ELSE 0 END) AS nulos_segmento,
    SUM(CASE WHEN estado IS NULL THEN 1 ELSE 0 END) AS nulos_estado,
    SUM(CASE WHEN pais IS NULL THEN 1 ELSE 0 END) AS nulos_pais,
    SUM(CASE WHEN data_cadastro IS NULL THEN 1 ELSE 0 END) AS nulos_data_cadastro
from dim_clientes_transformada;

-- Verificando a possibilidade de valores duplicados
SELECT 
    id_cliente,
    COUNT(*) AS quantidade
FROM dim_clientes_transformada
GROUP BY id_cliente
HAVING COUNT(*) > 1;
-- OK NAO EXISTEM

-- Verificando a distribuição dos dados qualitativos se está padronizado
-- Primeiro, a variável NOME CLIENTE
SELECT
    nome_cliente,
    COUNT(*) AS quantidade
FROM dim_clientes_transformada
GROUP BY nome_cliente
ORDER BY quantidade DESC;
-- Segundo, a variável SEGMENTO
SELECT
    segmento,
    COUNT(*) AS quantidade
FROM dim_clientes_transformada
GROUP BY segmento
ORDER BY quantidade DESC;

-- Terceiro, a variável ESTADO
SELECT
    estado,
    COUNT(*) AS quantidade
FROM dim_clientes_transformada
GROUP BY estado
ORDER BY quantidade DESC;

-- Quarto, a variável PAIS
SELECT
    pais,
    COUNT(*) AS quantidade
FROM dim_clientes_transformada
GROUP BY pais
ORDER BY quantidade DESC;

-- Quinto, a variável DATA CADASTRO
SELECT
    data_cadastro,
    COUNT(*) AS quantidade
FROM dim_clientes_transformada
GROUP BY data_cadastro
ORDER BY quantidade DESC;