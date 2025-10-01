-- SANITY CHECK DIM PRODUTOS
SELECT * FROM dim_produtos_transformada LIMIT 5;
-- Verificando a possibilidade de valores nulos
SELECT
    SUM(CASE WHEN id_produto IS NULL THEN 1 ELSE 0 END) AS nulos_id_produto,
    SUM(CASE WHEN nome_produto IS NULL THEN 1 ELSE 0 END) AS nulos_nome_produto,
    SUM(CASE WHEN categoria IS NULL THEN 1 ELSE 0 END) AS nulos_categoria,
    SUM(CASE WHEN embalagem IS NULL THEN 1 ELSE 0 END) AS nulos_embalagem,
    SUM(CASE WHEN linha_produto IS NULL THEN 1 ELSE 0 END) AS nulos_linha_produto
from dim_produtos_transformada;

-- Verificando a possibilidade de valores duplicados
SELECT 
    id_produto,
    COUNT(*) AS quantidade
FROM dim_produtos_transformada
GROUP BY id_produto
HAVING COUNT(*) > 1;
-- OK NAO EXISTEM

-- Verificando a distribuição dos dados qualitativos se está padronizado
-- Primerio, a variável PRODUTO
SELECT
    nome_produto,
    COUNT(*) AS quantidade
FROM dim_produtos_transformada
GROUP BY nome_produto
ORDER BY nome_produto DESC;
-- Segundo, a variável CATEGORIA
SELECT
     categoria,
    COUNT(*) AS quantidade
FROM dim_produtos_transformada
GROUP BY categoria
ORDER BY quantidade DESC;

-- Terceiro, a variável EMBALAGEM
SELECT
    embalagem,
    COUNT(*) AS quantidade
FROM dim_produtos_transformada
GROUP BY embalagem
ORDER BY quantidade DESC;

-- Quarto, a variável LINHA PRODUTO
SELECT
    linha_produto,
    COUNT(*) AS quantidade
FROM dim_produtos_transformada
GROUP BY linha_produto
ORDER BY quantidade DESC;
