-- Quantos pedidos existem por status (order_status)? Mostre do status com mais pedidos para o com menos.
-- Pergunta: quantos pedidos existem por status?
-- 1) Métrica: contagem de pedidos
-- 2) Tabela: orders
-- 3) Nível de detalhe: um resultado por ___
-- 4) Filtro: nenhum
-- 5) Agrupar/ordenar: agrupar por ___, ordenar pela contagem do maior para o menor

SELECT order_status,
       COUNT(*) AS total_pedidos
FROM orders
GROUP BY order_status
ORDER BY total_pedidos DESC;


-- Pergunta: quantas avaliações existem por nota?
-- 1) Métrica: contagem de avaliações
-- 2) Tabela: reviews
-- 3) Nível de detalhe: uma linha por nota
-- 4) Filtro: nenhum
-- 5) Agrupar por review_score, ordenar por review_score

SELECT review_score,
       COUNT(*) AS total_avaliacoes
FROM reviews
GROUP BY review_score
ORDER BY review_score;

-- Pergunta: qual o período dos dados?
-- 1) Métrica: primeira e última data de compra
-- 2) Tabela: orders
-- 3) Nível de detalhe: um resultado só (tabela inteira)
-- 4) Filtro: nenhum
-- 5) Agrupar/ordenar: não precisa

SELECT MIN(order_purchase_timestamp) AS primeira_compra,
       MAX(order_purchase_timestamp) AS ultima_compra
FROM orders;

-- Pergunta: quantos clientes únicos existem?
-- 1) Métrica: contagem de clientes diferentes
-- 2) Tabela: ___
-- 3) Nível de detalhe: um número só
-- 4) Filtro: nenhum
-- 5) Agrupar/ordenar: não precisa

SELECT COUNT(DISTINCT customer_unique_id) AS clientes_unicos,
       COUNT(*) AS linhas_na_tabela
FROM customers;

SELECT 96478 / 99441 * 100 AS percentual_entregues;
-- Aproximadamente 97% dos pedidos foram entregues. Os outros 3% estão em outros status, principalmente shipped e canceled.