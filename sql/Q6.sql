-- 1. Cria o calendário completo entre a primeira e a última venda
WITH DimCalendario AS (
    SELECT data_serie::DATE AS data_calendario
    FROM generate_series(
        (SELECT MIN(data_venda) FROM vendas_2023_2024), 
        (SELECT MAX(data_venda) FROM vendas_2023_2024), 
        '1 day'::interval
    ) AS data_serie
),

-- 2. Agrega o total vendido por cada dia existente na base de vendas
VendasDiarias AS (
    SELECT 
        data_venda,
        SUM(total) AS valor_venda_dia
    FROM vendas_2023_2024
    GROUP BY data_venda
),

-- 3. Cruza o calendário completo com as vendas (Dias sem venda recebem 0)
VendasComCalendario AS (
    SELECT 
        c.data_calendario,
        EXTRACT(DOW FROM c.data_calendario) AS dia_semana_num,
        COALESCE(v.valor_venda_dia, 0) AS valor_venda
    FROM DimCalendario c
    LEFT JOIN VendasDiarias v ON c.data_calendario = v.data_venda
)

-- 4. Calcula a média real por dia da semana e traduz para Português
SELECT 
    CASE dia_semana_num
        WHEN 0 THEN 'Domingo'
        WHEN 1 THEN 'Segunda-feira'
        WHEN 2 THEN 'Terça-feira'
        WHEN 3 THEN 'Quarta-feira'
        WHEN 4 THEN 'Quinta-feira'
        WHEN 5 THEN 'Sexta-feira'
        WHEN 6 THEN 'Sábado'
    END AS dia_semana,
    ROUND(AVG(valor_venda), 2) AS media_vendas,
    COUNT(data_calendario) AS total_dias_avaliados
FROM VendasComCalendario
GROUP BY dia_semana_num, dia_semana
ORDER BY media_vendas ASC; -- O primeiro resultado será o pior dia de vendas