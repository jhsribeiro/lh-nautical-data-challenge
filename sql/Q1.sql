-- Parte 1: Inspecionar o total de colunas da tabela
SELECT COUNT(*) AS total_colunas
FROM information_schema.columns
WHERE table_name = '../datasets/raw/vendas_2023_2024';

-- Parte 2: Extrair métricas gerais, datas e estatísticas da coluna 'total'
SELECT 
    COUNT(*) AS total_linhas,
    MIN(sale_date) AS data_minima,
    MAX(sale_date) AS data_maxima,
    MIN(total) AS valor_minimo,
    MAX(total) AS valor_maximo,
    ROUND(AVG(total), 2) AS valor_medio
FROM vendas_2023_2024.csv;