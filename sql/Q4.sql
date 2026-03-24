-- 1. Captar a taxa de câmbio correta (resolvendo fins de semana/feriados)
WITH CambioAplicado AS (
    SELECT DISTINCT
        v.sale_date,
        -- Subconsulta correlacionada para ir buscar a última cotação disponível até à data da venda
        (SELECT h.cotacao_dolar 
         FROM historico_cambio_bcb h 
         WHERE h.data_cambio <= v.sale_date 
         ORDER BY h.data_cambio DESC 
         LIMIT 1) AS taxa_cambio
    FROM vendas_normalizadas v
),

-- 2. Cruzar vendas, custos em USD e câmbio para encontrar os lucros e prejuízos
VendasComCusto AS (
    SELECT 
        v.id_product,
        c.product_name,
        v.total AS receita_transacao,
        -- Custo BRL = Preço USD * Taxa de Câmbio * Quantidade vendida
        (c.usd_price * ca.taxa_cambio * v.qtd) AS custo_total_brl,
        (v.total - (c.usd_price * ca.taxa_cambio * v.qtd)) AS lucro_transacao
    FROM vendas_normalizadas v
    JOIN custos_importacao c ON v.id_product = c.product_id
    JOIN CambioAplicado ca ON v.sale_date = ca.sale_date
),

-- 3. Agregar os dados por produto e somar os prejuízos absolutos
AgregacaoProduto AS (
    SELECT 
        id_product,
        product_name,
        SUM(receita_transacao) AS receita_total,
        SUM(CASE WHEN lucro_transacao < 0 THEN ABS(lucro_transacao) ELSE 0 END) AS prejuizo_total
    FROM VendasComCusto
    GROUP BY id_product, product_name
)

-- 4. Selecionar o ranking final de perdas
SELECT 
    id_product,
    product_name,
    ROUND(receita_total, 2) AS receita_total