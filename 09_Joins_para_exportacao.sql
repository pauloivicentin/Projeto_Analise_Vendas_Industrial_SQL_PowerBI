-- Realizando primeiro o join de tudo
SELECT 
    *
FROM fato_vendas_final AS fv
LEFT JOIN dim_clientes_transformada AS dc
    ON fv.id_cliente = dc.id_cliente
LEFT JOIN dim_vendedores_transformada AS dv
    ON fv.id_vendedor = dv.id_vendedor
LEFT JOIN dim_produtos_transformada AS dp
    ON fv.id_produto = dp.id_produto
LEFT JOIN dim_tempo AS dt
    ON fv.id_data = dt.id_data
LIMIT 10;

-- Criando a view com o join só com os dados que iremos fazer as analises
-- Ou seja, os que interessam
SELECT 
    fv.id_venda,
    fv.id_cliente,
    fv.id_vendedor,
    fv.id_produto,
    fv.id_data,
    fv.canal_venda,
    fv.quantidade,
    fv.custo_unitario,
    fv.preco_unitario,
    dc.nome_cliente,
    dc.segmento,
    dc.estado,
    dc.pais,
    dv.nome_vendedor,
    dv.regiao_vendas,
    dp.nome_produto,
    dp.categoria,
    dp.embalagem,
    dp.linha_produto,
    dt.data
FROM fato_vendas_final AS fv
LEFT JOIN dim_clientes_transformada AS dc
    ON fv.id_cliente = dc.id_cliente
LEFT JOIN dim_vendedores_transformada AS dv
    ON fv.id_vendedor = dv.id_vendedor
LEFT JOIN dim_produtos_transformada AS dp
    ON fv.id_produto = dp.id_produto
LEFT JOIN dim_tempo AS dt
    ON fv.id_data = dt.id_data
