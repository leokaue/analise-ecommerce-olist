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