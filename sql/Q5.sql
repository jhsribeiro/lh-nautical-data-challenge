WITH VendasProdutos AS (
    -- 1. Unir as vendas aos produtos para ter acesso à categoria atualizada
    SELECT 
        v.id_client,
        v.id AS id_venda,
        v.total,
        v.qtd,
        p.actual_category AS categoria
    FROM vendas_normalizadas v
    JOIN produtos_normalizados p ON v.id_product = p.id_product
),

MetricasClientes AS (
    -- 2. Calcular Faturação, Frequência, Ticket Médio e Diversidade de Categorias
    SELECT 
        id_client,
        SUM(total) AS faturamento_total,
        COUNT(DISTINCT id_venda) AS frequencia,
        (SUM(total) / NULLIF(COUNT(DISTINCT id_venda), 0)) AS ticket_medio,
        COUNT(DISTINCT categoria) AS categorias_distintas
    FROM VendasProdutos
    GROUP BY id_client
),

ClientesElite AS (
    -- 3. Filtrar clientes com 3 ou mais categorias e selecionar o Top 10
    SELECT 
        id_client,
        ticket_medio,
        categorias_distintas
    FROM MetricasClientes
    WHERE categorias_distintas >= 3
    ORDER BY ticket_medio DESC, id_client ASC
    LIMIT 10
),

ConsumoElite AS (
    -- 4. Isolar a quantidade de itens comprados por categoria APENAS por este Top 10
    SELECT 
        vp.categoria,
        SUM(vp.qtd) AS quantidade_itens
    FROM VendasProdutos vp
    JOIN ClientesElite ce ON vp.id_client = ce.id_client
    GROUP BY vp.categoria
)

-- 5. Descobrir a categoria com maior volume de compras
SELECT 
    categoria AS categoria_preferida,
    quantidade_itens
FROM ConsumoElite
ORDER BY quantidade_itens DESC;