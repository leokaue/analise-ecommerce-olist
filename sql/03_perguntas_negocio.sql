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