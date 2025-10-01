-- SANITY CHECK DIM TEMPO
SELECT * FROM dim_tempo LIMIT 10
-- Verificando a possibilidade de valores nulos
SELECT
    SUM(CASE WHEN id_data IS NULL THEN 1 ELSE 0 END) AS nulos_id_data,
    SUM(CASE WHEN data IS NULL THEN 1 ELSE 0 END) AS nulos_data,
    SUM(CASE WHEN ano IS NULL THEN 1 ELSE 0 END) AS nulos_ano,
    SUM(CASE WHEN mes IS NULL THEN 1 ELSE 0 END) AS nulos_mes,
    SUM(CASE WHEN trimestre IS NULL THEN 1 ELSE 0 END) AS nulos_trimestre,
    SUM(CASE WHEN dia_semana IS NULL THEN 1 ELSE 0 END) AS dia_semana
from dim_tempo;
-- ok sem nulos
Select
    id_data
from dim_tempo
where id_data = 0;
-- Verificando a possibilidade de valores duplicados
SELECT 
    id_data,
    COUNT(*) AS quantidade
FROM dim_tempo
GROUP BY id_data
HAVING COUNT(*) > 1;
-- OK NAO EXISTEM

-- Verificando a distribuição dos dados qualitativos se está padronizado
-- 1 nome do clinete
SELECT
    ano,
    COUNT(*) AS quantidade
FROM dim_tempo
GROUP BY ano
ORDER BY ano DESC;
-- 2  mes
SELECT
     mes,
    COUNT(*) AS quantidade
FROM dim_tempo
GROUP BY mes
ORDER BY mes DESC;

-- 3 semana
SELECT
    trimestre,
    COUNT(*) AS quantidade
FROM dim_tempo
GROUP BY trimestre
ORDER BY quantidade DESC;

-- 4 linha_produto
SELECT
    dia_semana,
    COUNT(*) AS quantidade
FROM dim_tempo
GROUP BY dia_semana
ORDER BY quantidade DESC;
