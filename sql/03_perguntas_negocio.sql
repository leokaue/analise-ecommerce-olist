-- ============================================
-- PERGUNTA 1: Quais os 5 estados com mais pedidos?
-- ============================================
-- 1) Métrica: contagem de pedidos
-- 2) Tabelas: orders + customers (ligadas por customer_id)
-- 3) Nível de detalhe: um resultado por estado
-- 4) Filtro: nenhum
-- 5) Agrupar por estado, ordenar do maior para o menor, 5 primeiros

SELECT c.customer_state AS estado,
       COUNT(*) AS total_pedidos
FROM orders AS o
JOIN customers AS c
  ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY total_pedidos DESC
LIMIT 5;

-- Conclusão: “SP concentra 42% dos pedidos, mais que o triplo vezes que o segundo colocado (RJ). --
-- Os 3 maiores estados (SP, RJ e MG) somam cerca de 67% do total.”


-- Pergunta 2: qual o faturamento total e o ticket médio por pedido?
-- 1) Métrica: soma de valores e média por pedido
-- 2) Tabela: order_items
-- 3) Nível de detalhe: um resultado só
-- 4) Filtro: nenhum (por enquanto, todos os status)
-- 5) Agrupar/ordenar: não precisa

SELECT SUM(price) AS faturamento_total,
       SUM(price) / COUNT(DISTINCT order_id) AS ticket_medio
FROM order_items;

-- O marketplace faturou cerca de R$ 13,6 milhões, com ticket médio de R$ 138 por pedido.”

-- ============================================
-- PERGUNTA 3: Qual o faturamento por mês?
-- ============================================
-- 1) Métrica: soma do valor dos itens (price)
-- 2) Tabelas: orders (data) + order_items (valor), ligadas por order_id
-- 3) Nível de detalhe: um resultado por mês
-- 4) Filtro: nenhum (considera todos os status)
-- 5) Agrupar por mês, ordenar do mais antigo para o mais recente

SELECT DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS mes,
       SUM(oi.price) AS faturamento
FROM orders AS o
JOIN order_items AS oi
  ON o.order_id = oi.order_id
GROUP BY mes
ORDER BY mes;

-- Conclusão: o maior faturamento mensal foi em novembro de 2017 (R$ 1,01 milhão),
-- mês da Black Friday. Em 2018 as vendas se mantiveram perto de R$ 1 milhão
-- por mês, indicando crescimento sustentado.
