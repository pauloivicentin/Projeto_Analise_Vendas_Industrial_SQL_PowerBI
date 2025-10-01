-- Para antes de criar a modelagem de dados para exportar os dados pro PBI,
-- Vamos criar a tabela fato que está precisando de correções antes de fazer os JOINS

SELECT
    id_venda,
    id_cliente,
    id_vendedor,
    id_produto,
    id_data,
    canal_venda,
    quantidade,
    custo_unitario,
    CASE 
        WHEN preco_unitario = 0
            THEN (
                SELECT AVG(preco_unitario)
                FROM fato_vendas_transformada AS fv
                WHERE fv.id_produto = fato_vendas_transformada.id_produto
                AND fv.preco_unitario > 0
            )
        ELSE preco_unitario
    END AS preco_unitario
FROM fato_vendas_transformada;

--criando a vizualização com a tabela fato corrigida
CREATE VIEW fato_vendas_final AS
SELECT
    id_venda,
    id_cliente,
    id_vendedor,
    id_produto,
    id_data,
    canal_venda,
    quantidade,
    custo_unitario,
    CASE 
        WHEN preco_unitario = 0
            THEN (
                SELECT AVG(preco_unitario)
                FROM fato_vendas_transformada AS fv
                WHERE fv.id_produto = fato_vendas_transformada.id_produto
                AND fv.preco_unitario > 0
            )
        ELSE preco_unitario
    END AS preco_unitario
FROM fato_vendas_transformada;

-- Confirmando se a view foi criada
SELECT 
    * 
FROM fato_vendas_final
WHERE preco_unitario = 0;

-- certo nao tem nenhum preco unitario = 0