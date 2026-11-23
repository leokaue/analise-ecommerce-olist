-- ============================================
-- PERGUNTA 4: Quais as categorias que mais e menos faturam?
-- ============================================
-- 1) Métrica: soma do valor dos itens (price)
-- 2) Tabelas: order_items + products + category_translation
--    (ligadas por product_id e por product_category_name)
-- 3) Nível de detalhe: um resultado por categoria
-- 4) Filtro: nenhum (considera todos os status)
-- 5) Agrupar por categoria; ordenar DESC (top 10) e ASC (10 menores)

-- Top 10 categorias por faturamento
SELECT ct.product_category_name_english AS categoria,
       SUM(oi.price) AS faturamento
FROM order_items AS oi
JOIN products AS p
  ON oi.product_id = p.product_id
JOIN category_translation AS ct
  ON p.product_category_name = ct.product_category_name
GROUP BY categoria
ORDER BY faturamento DESC
LIMIT 10;

-- 10 categorias com menor faturamento
SELECT ct.product_category_name_english AS categoria,
       SUM(oi.price) AS faturamento
FROM order_items AS oi
JOIN products AS p
  ON oi.product_id = p.product_id
JOIN category_translation AS ct
  ON p.product_category_name = ct.product_category_name
GROUP BY categoria
ORDER BY faturamento ASC
LIMIT 10;

-- Diferença entre a maior e a menor categoria
WITH receita AS (
  SELECT ct.product_category_name_english AS categoria,
         SUM(oi.price) AS faturamento
  FROM order_items AS oi
  JOIN products AS p
    ON oi.product_id = p.product_id
  JOIN category_translation AS ct
    ON p.product_category_name = ct.product_category_name
  GROUP BY categoria
)
SELECT MAX(faturamento) AS maior,
       MIN(faturamento) AS menor,
       MAX(faturamento) - MIN(faturamento) AS diferenca,
       ROUND(MAX(faturamento) / MIN(faturamento), 0) AS vezes_maior
FROM receita;

-- Como funciona (escreva com as suas palavras):
-- O WITH cria ...; o MAX e o MIN pegam ...

-- Conclusão: o faturamento é concentrado. A categoria health_beauty lidera com
-- R$ 1,26 milhão (cerca de 9% do total), enquanto a menor, security_and_services,
-- faturou R$ 283: a maior vende cerca de 4.400 vezes mais.

-- Limitação: itens de produtos sem categoria ou sem tradução ficam de fora do JOIN,
-- então a soma das categorias é um pouco menor que o faturamento total (R$ 13,59 milhões).