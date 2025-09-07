-- 1. Exiba o nome de cada produto junto com o nome da categoria à qual ele pertence.
SELECT produto.nome, categoria.nome_categoria
FROM produto
JOIN categoria ON produto.id_categoria = categoria.id;

-- 2. Pedidos + nome completo do consumidor
SELECT pedido.id, CONCAT(consumidor.nome, ' ', consumidor.sobrenome) AS consumidor
FROM pedido
JOIN consumidor ON pedido.id_consumidor = consumidor.id;

-- 3. Produtos comprados em cada pedido
SELECT pedido.id, produto.nome, detalhepedido.quantidade_comprada
FROM pedido
JOIN detalhepedido ON pedido.id = detalhepedido.id_pedido
JOIN produto ON detalhepedido.id_produto = produto.id;

-- 4. Todos os consumidores, mesmo sem pedidos
SELECT consumidor.id, consumidor.nome, pedido.id AS pedido
FROM pedido
RIGHT JOIN consumidor ON pedido.id_consumidor = consumidor.id;

-- 5. Mostrar todos os pedidos, mesmo sem detalhes
SELECT pedido.id, detalhepedido.id_produto
FROM pedido
LEFT JOIN detalhepedido ON pedido.id = detalhepedido.id_pedido;

-- 6. Produtos não vendidos
SELECT produto.nome, detalhepedido.id_pedido
FROM produto
LEFT JOIN detalhepedido ON produto.id = detalhepedido.id_produto
WHERE detalhepedido.id_pedido IS NULL;

-- 7. Produtos + quantidade vendida (sem somar)
SELECT produto.nome, detalhepedido.quantidade_comprada
FROM produto
LEFT JOIN detalhepedido ON produto.id = detalhepedido.id_produto;

-- 8. Valor de cada item em cada pedido
SELECT pedido.id, produto.nome,
       produto.preco, detalhepedido.quantidade_comprada,
       (produto.preco * detalhepedido.quantidade_comprada) AS valor_item
FROM pedido
JOIN detalhepedido ON pedido.id = detalhepedido.id_pedido
JOIN produto ON detalhepedido.id_produto = produto.id;

-- 9. Produtos vendidos (quantas vezes apareceram nos pedidos)
SELECT produto.nome, COUNT(detalhepedido.id) AS vezes_vendido
FROM produto
JOIN detalhepedido ON produto.id = detalhepedido.id_produto
GROUP BY produto.nome;

-- 10. Consumidores que compraram mais de 3 unidades de um produto
SELECT consumidor.nome, consumidor.sobrenome, produto.nome, detalhepedido.quantidade_comprada
FROM consumidor
JOIN pedido ON consumidor.id = pedido.id_consumidor
JOIN detalhepedido ON pedido.id = detalhepedido.id_pedido
JOIN produto ON detalhepedido.id_produto = produto.id
WHERE detalhepedido.quantidade_comprada > 3;

-- 11. Preço de cada produto por categoria
SELECT categoria.nome_categoria, produto.nome, produto.preco
FROM categoria
JOIN produto ON categoria.id = produto.id_categoria
ORDER BY categoria.nome_categoria;

-- 12. Produtos comprados em mais de 3 pedidos diferentes
SELECT produto.nome, COUNT(DISTINCT detalhepedido.id_pedido) AS qtd_pedidos
FROM produto
JOIN detalhepedido ON produto.id = detalhepedido.id_produto
GROUP BY produto.nome
HAVING COUNT(DISTINCT detalhepedido.id_pedido) > 3;

-- 13. Quantos produtos existem em cada categoria
SELECT categoria.nome_categoria, COUNT(produto.id) AS qtd_produtos
FROM categoria
LEFT JOIN produto ON categoria.id = produto.id_categoria
GROUP BY categoria.nome_categoria;

-- 14. Consumidores com mais de 2 pedidos
SELECT consumidor.nome, consumidor.sobrenome, COUNT(pedido.id) AS qtd_pedidos
FROM consumidor
JOIN pedido ON consumidor.id = pedido.id_consumidor
GROUP BY consumidor.id
HAVING COUNT(pedido.id) > 2;

-- 15. Pedidos com mais de um tipo de produto
SELECT pedido.id, COUNT(DISTINCT detalhepedido.id_produto) AS qtd_produtos
FROM pedido
JOIN detalhepedido ON pedido.id = detalhepedido.id_pedido
GROUP BY pedido.id
HAVING COUNT(DISTINCT detalhepedido.id_produto) > 1;

-- 16. Categoria com maior número de produtos
SELECT categoria.nome_categoria, COUNT(produto.id) AS qtd_produtos
FROM categoria
LEFT JOIN produto ON categoria.id = produto.id_categoria
GROUP BY categoria.nome_categoria
ORDER BY qtd_produtos DESC
LIMIT 1;

-- 17. Produtos ordenados pelo maior preço
SELECT produto.nome, produto.preco
FROM produto
ORDER BY produto.preco DESC;

-- 18. Consumidores ordenados pelo sobrenome
SELECT consumidor.nome, consumidor.sobrenome
FROM consumidor
ORDER BY consumidor.sobrenome ASC;

-- 19. Pedidos mais recentes primeiro
SELECT pedido.id, pedido.data_hora_pedido, CONCAT(consumidor.nome, ' ', consumidor.sobrenome) AS consumidor
FROM pedido
JOIN consumidor ON pedido.id_consumidor = consumidor.id
ORDER BY pedido.data_hora_pedido DESC;

-- 20. Produtos com menor preço
SELECT produto.nome, produto.preco
FROM produto
ORDER BY produto.preco ASC;

-- 21. Consumidores que compraram produtos de mais de uma categoria
SELECT consumidor.nome, consumidor.sobrenome, COUNT(DISTINCT categoria.id) AS categorias_diferentes
FROM consumidor
JOIN pedido ON consumidor.id = pedido.id_consumidor
JOIN detalhepedido ON pedido.id = detalhepedido.id_pedido
JOIN produto ON detalhepedido.id_produto = produto.id
JOIN categoria ON produto.id_categoria = categoria.id
GROUP BY consumidor.id
HAVING COUNT(DISTINCT categoria.id) > 1;

-- 22. Top 5 produtos mais vendidos
SELECT produto.nome, COUNT(detalhepedido.id) AS vezes_vendido
FROM produto
JOIN detalhepedido ON produto.id = detalhepedido.id_produto
GROUP BY produto.nome
ORDER BY vezes_vendido DESC
LIMIT 5;

-- 23. Consumidores que compraram produtos da categoria 'Livros'
SELECT DISTINCT consumidor.nome, consumidor.sobrenome
FROM consumidor
JOIN pedido ON consumidor.id = pedido.id_consumidor
JOIN detalhepedido ON pedido.id = detalhepedido.id_pedido
JOIN produto ON detalhepedido.id_produto = produto.id
JOIN categoria ON produto.id_categoria = categoria.id
WHERE categoria.nome_categoria = 'Livros';

-- 24. Produtos com preço abaixo de 100
SELECT produto.nome, produto.preco
FROM produto
WHERE produto.preco < 100;

-- 25. Unificar nomes de consumidores e produtos sem duplicados
SELECT consumidor.nome FROM consumidor
UNION
SELECT produto.nome FROM produto;

-- 26. Relatório com nome e tipo
SELECT consumidor.nome, 'Consumidor' AS tipo FROM consumidor
UNION
SELECT produto.nome, 'Produto' AS tipo FROM produto;
