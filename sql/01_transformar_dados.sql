-- Criando a tabela de clientes com transformação de dados

-- tabela dimensao clientes
CREATE TABLE dim_clientes_transformada AS
SELECT 
    CAST(id_cliente AS INT) AS id_cliente,
    nome_cliente,
    segmento,
    estado,
    pais,
    CAST(data_cadastro AS DATE) AS data_cadastro
FROM dim_clientes

Select *
-- tabela dimensao vendedores
CREATE TABLE dim_vendedores_transformada AS
SELECT 
    CAST(id_vendedor AS INT) AS id_vendedor,
    nome_vendedor,
    regiao_vendas,
    CAST(data_admissao AS DATE) AS data_admissao
FROM dim_vendedores;
-- tabela dimensao produtos
CREATE TABLE dim_produtos_transformada AS
SELECT
    CAST(id_produto AS INT) AS id_produto,
    nome_produto,
    categoria,
    embalagem,
    linha_produto
FROM dim_produtos;
-- tabela fato vendas
CREATE TABLE fato_vendas_transformada AS
SELECT
    CAST(id_venda AS INT) AS id_venda,
    CAST(id_cliente AS INT) AS id_cliente,
    CAST(id_vendedor AS INT) AS id_vendedor,
    CAST(id_produto AS INT) AS id_produto,
    CAST(id_data AS INT) AS id_data,
    CAST(quantidade AS INT) AS quantidade,
    CAST(preco_unitario AS REAL) AS preco_unitario,
    CAST(custo_unitario AS REAL) AS custo_unitario,
    canal_venda
from fato_vendas
