-- Total de pedidos por cliente
SELECT c.nome, COUNT(p.id_pedido) AS total_pedidos
FROM Cliente c
LEFT JOIN Pedido p ON c.id_cliente = p.id_cliente
GROUP BY c.nome;

-- Algum fornecedor também é cliente?
SELECT f.nome
FROM Fornecedor f
JOIN Cliente c ON f.cnpj = c.cpf_cnpj;

-- Produtos, fornecedores e estoques
SELECT p.nome AS produto, f.nome AS fornecedor, e.quantidade
FROM Produto p
JOIN Fornecedor f ON p.id_fornecedor = f.id_fornecedor
JOIN Estoque e ON p.id_produto = e.id_produto;

-- Valor total de cada item
SELECT i.id_item, p.nome AS produto, (i.quantidade * i.preco_unitario) AS valor_total
FROM ItemPedido i
JOIN Produto p ON i.id_produto = p.id_produto;

-- Filtro com HAVING
SELECT p.id_produto, SUM(i.quantidade) AS total_vendido
FROM ItemPedido i
JOIN Produto p ON i.id_produto = p.id_produto
GROUP BY p.id_produto
HAVING total_vendido > 1;
