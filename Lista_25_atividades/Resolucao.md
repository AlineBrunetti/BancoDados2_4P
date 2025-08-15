1. Liste todos os produtos, indicando a quantidade vendida (se houver). Produtos sem venda devem aparecer com valores nulos ou zero.
  ```sql
    SELECT produto.id, produto.nome, produto.preco, pedido.id, detalhepedido.quantidade_comprada, detalhepedido.quantidade_comprada * produto.preco AS valorTT 
    FROM pedido
    INNER JOIN detalhepedido on pedido.id = detalhepedido.id_pedido
    INNER JOIN produto on produto.id = detalhepedido.id_produto
    ORDER BY quantidade_comprada desc;
  ```
2. Mostre os produtos com menor estoque, ordenado do menor para o maior.
   ```sql
    ALTER TABLE produto add COLUMN estoque int;
    UPDATE produto
    SET estoque = CASE id
      WHEN 1 THEN 47
      WHEN 2 THEN 12
      WHEN 3 THEN 89
      WHEN 4 THEN 34
      WHEN 5 THEN 76
      WHEN 6 THEN 5
      WHEN 7 THEN 63
      WHEN 8 THEN 28
      WHEN 9 THEN 91
      WHEN 10 THEN 54
      WHEN 11 THEN 8
      WHEN 12 THEN 70
      WHEN 13 THEN 23
      WHEN 14 THEN 44
      WHEN 15 THEN 17
      WHEN 16 THEN 82
      WHEN 17 THEN 36
      WHEN 18 THEN 60
      WHEN 19 THEN 3
      WHEN 20 THEN 99
      ELSE estoque
    END
    WHERE id IN (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20);
    
    SET SQL_SAFE_UPDATES = 0;
    DELETE FROM produto WHERE estoque IS NULL;
    
    SELECT produto.nome,produto.estoque from produto
    order by produto.estoque asc;
   ```
3. Mostre todos os consumidores, mesmo os que ainda não fizeram pedidos
  ```sql
  SELECT consumidor.nome, consumidor.id from consumidor;
  ```
4. Exiba todos os consumidores e seus pedidos, usando RIGHT JOIN. Explique a diferença desse JOIN em relação ao INNER JOIN nas tabelas usadas
   ```sql
   SELECT consumidor.nome, consumidor.id, pedido.id from consumidor
    right join pedido
    on consumidor.id = pedido.id_consumidor;
   ```
5. Liste todos os pedidos mostrando o nome completo (nome e sobrenome) do consumidor que realizou cada um
   ```sql
    select consumidor.nome, consumidor.sobrenome,pedido.id from pedido
    inner join consumidor
    on consumidor.id = pedido.id_consumidor;
   ```
6. Liste todos os produtos que foram vendidos, mostrando o nome do produto e a quantidade total vendida
   ```sql
    SELECT produto.nome, detalhepedido.quantidade_comprada, produto.preco, detalhepedido.quantidade_comprada * produto.preco AS valorTT 
    FROM pedido
    inner join detalhepedido on detalhepedido.id_pedido = pedido.id
    inner join produto on detalhepedido.id_produto = produto.id
    ORDER BY valorTT desc;
   ```







