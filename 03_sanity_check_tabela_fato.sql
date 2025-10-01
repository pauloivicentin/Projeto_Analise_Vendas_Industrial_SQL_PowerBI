-- Verificando a quantidade de registros na tabela fato_vendaas
SELECT 
    count(*) AS total_registros
FROM fato_vendas_transformada;

-- Verificando a duplicidade
SELECT 
    id_venda,
    COUNT(*) AS quantidade
FROM fato_vendas_transformada
GROUP BY id_venda
HAVING COUNT(*) > 1;

-- Verificando valores nulos nas colunas
SELECT
    SUM(CASE WHEN id_venda IS NULL THEN 1 ELSE 0 END) AS nulos_id_venda,
    SUM(CASE WHEN id_cliente IS NULL THEN 1 ELSE 0 END) AS nulos_id_cliente,
    SUM(CASE WHEN id_produto IS NULL THEN 1 ELSE 0 END) AS nulos_id_produto,
    SUM(CASE WHEN id_vendedor IS NULL THEN 1 ELSE 0 END) AS nulos_id_vendedor,
    SUM(CASE WHEN id_data IS NULL THEN 1 ELSE 0 END) AS nulos_id_data,
    SUM(CASE WHEN quantidade IS NULL THEN 1 ELSE 0 END) AS nulos_quantidade,
    SUM(CASE WHEN preco_unitario IS NULL THEN 1 ELSE 0 END) AS nulos_preco_unitario,
    SUM(CASE WHEN custo_unitario IS NULL THEN 1 ELSE 0 END) AS nulos_custo_unitario,
    SUM(CASE WHEN canal_venda IS NULL THEN 1 ELSE 0 END) AS nulos_canal_venda
from fato_vendas_transformada;

-- Verificando os valores máximos e mínimos das colunas numéricas
-- para identificar possiveis 

SELECT
    'custo_unitario' AS variavel,
    MAX(custo_unitario) AS maximo,
    MIN(custo_unitario) AS minimo
from fato_vendas_transformada

union all

SELECT
    'quantidade' AS variavel,
    MAX(quantidade) AS maximo,
    MIN(quantidade) AS minimo
from fato_vendas_transformada

union all

SELECT
    'preco_unitario' AS variavel,
    MAX(preco_unitario) AS maximo,
    MIN(preco_unitario) AS minimo
from fato_vendas_transformada;
-- temos precos unitarios igual a 0, então vamos fazer uma verificação mais detalhada
-- Verificando id_do_produto quando o preco é = 0
Select
    id_produto,
    preco_unitario
from fato_vendas_transformada
where preco_unitario = 0
order by id_produto asc;

-- Vamos transformar os que estão com preço unitário = 0 como a média do preço de outro produto com o mesmo id

SELECT
    id_produto,
    preco_unitario,
    CASE
        WHEN preco_unitario = 0 -- quando o preço for igual a 0
            THEN (
                SELECT AVG(preco_unitario)
                from fato_vendas_transformada AS fv
                WHERE fv.id_produto = fato_vendas_transformada.id_produto
                     AND fv.preco_unitario > 0
            )
            ELSE preco_unitario
    END AS preco_unitario_corrigido 
FROM fato_vendas_transformada
where preco_unitario = 0;

-- Verificando os valores unicos de canal_venda
SELECT
    canal_venda,
    COUNT(*) AS quantidade
FROM fato_vendas_transformada
GROUP BY canal_venda;
-- ok Tudo certo.



-- Verifiquei também que há vendedores com valores = 0
SELECT
    *
FROM fato_vendas_transformada
WHERE id_cliente = 0 or id_cliente IS NULL
   OR id_produto = 0 or id_produto IS NULL
   OR id_data = 0 or id_data IS NULL
   OR id_vendedor = 0 or id_vendedor IS NULL
   OR quantidade <= 0 OR quantidade = 0 OR quantidade IS NULL
   OR custo_unitario = 0 OR custo_unitario IS NULL;

SELECT 
    id_venda,
    id_vendedor,
    CASE 
        WHEN id_vendedor = 0 OR id_vendedor IS NULL
            THEN 'Vendedor Desconhecido'
            ELSE id_vendedor
    END AS id_vendedor_corrigido
FROM fato_vendas_transformada
ORDER BY id_vendedor asc;