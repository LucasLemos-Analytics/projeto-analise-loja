
-- =====================================
-- CONSULTAS DE ANÁLISE DE DADOS
-- Projeto: Análise de Dados - Loja
-- =====================================


-- 1. Qual é o faturamento total da loja? --

SELECT 
    SUM(p.quantidade * pr.preco) AS faturamento_total
FROM pedidos p
JOIN produtos pr ON p.id_produto = pr.id_produto;


-- 2. Qual produto vendeu mais em quantidade? --

SELECT 
    pr.nome_produto,
    SUM(p.quantidade) AS total_vendido
FROM pedidos p
JOIN produtos pr ON p.id_produto = pr.id_produto
GROUP BY pr.nome_produto
ORDER BY total_vendido DESC;


-- 3. Quais clientes mais gastaram na loja? --

SELECT 
    c.nome AS cliente,
    SUM(p.quantidade * pr.preco) AS total_gasto
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente
JOIN produtos pr ON p.id_produto = pr.id_produto
GROUP BY c.nome
ORDER BY total_gasto DESC;


-- 4. Qual foi o faturamento por mês? --

SELECT 
    MONTH(p.data) AS mes,
    SUM(p.quantidade * pr.preco) AS faturamento_mensal
FROM pedidos p
JOIN produtos pr ON p.id_produto = pr.id_produto
GROUP BY MONTH(p.data)
ORDER BY mes;


-- 5. Quantos pedidos foram realizados por mês? --

SELECT 
    MONTH(data) AS mes,
    COUNT(id_pedido) AS total_pedidos
FROM pedidos
GROUP BY MONTH(data)
ORDER BY mes;


-- 6. Quais cidades possuem mais clientes? --

SELECT 
    e.cidade,
    COUNT(c.id_cliente) AS total_clientes
FROM clientes c
JOIN enderecos e ON c.id_cliente = e.id_cliente
GROUP BY e.cidade
ORDER BY total_clientes DESC;


-- 7. Qual é o ticket médio da loja? -- 

SELECT 
    AVG(p.quantidade * pr.preco) AS ticket_medio
FROM pedidos p
JOIN produtos pr ON p.id_produto = pr.id_produto;


-- 8. Quais produtos geraram maior faturamento? --

SELECT 
    pr.nome_produto,
    SUM(p.quantidade * pr.preco) AS faturamento_produto
FROM pedidos p
JOIN produtos pr ON p.id_produto = pr.id_produto
GROUP BY pr.nome_produto
ORDER BY faturamento_produto DESC;


-- 9. Lista completa de pedidos com cliente, produto, data, quantidade e valor total --

SELECT 
    p.id_pedido,
    c.nome AS cliente,
    pr.nome_produto AS produto,
    p.data,
    p.quantidade,
    pr.preco,
    (p.quantidade * pr.preco) AS valor_total
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente
JOIN produtos pr ON p.id_produto = pr.id_produto
ORDER BY p.id_pedido;


-- 10. Quais clientes compraram produtos acima de R$ 1.000,00? --

SELECT 
    c.nome AS cliente,
    pr.nome_produto AS produto,
    pr.preco,
    p.quantidade,
    (p.quantidade * pr.preco) AS valor_total
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente
JOIN produtos pr ON p.id_produto = pr.id_produto
WHERE pr.preco > 1000
ORDER BY valor_total DESC;