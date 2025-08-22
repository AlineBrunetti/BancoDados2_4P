# Arquitetura - continuação

PS: faltei na aula passada, esta é uma continuação

1. Autenticação - passa credenciais e o software valida
2. Autorização - aquilo que vem depois da autenticação, o que o usuário pode ou não fazer
3. Comandos usados
   ```sql
   DCL -> DATA CONTROL LANGUAGE
   GRANT: Permitir, dar permissão, dar acesso
   REVOKE: Revogar, retirar, cancelar
   FLUSH: Atualizar, update

   SELECT * FROM mysql.USER -> traz todos os usuários que tem acesso ao banco
   SELECT * FROM mysql.db -> usuarios criados dentro do banco de dados

   CREATE USER 'bruno'@'localhost' identified BY '6150' -> cria usuário que tem acesso dentro do banco (em SELECT * FROM mysql.db; não aparece, em SELECT * FROM mysql.USER; aparece)

   DROP USER 'bruno'@'localhost' -> deleta usuário criado acima

   GRANT SELECT, UPDATE ON sistemapedidos.pedido TO 'bruno'@'localhost' -> dando permissão somente para select e update na tabela pedido do banco sistemapedidos
   GRANT SELECT, UPDATE ON sistemapedidos.* TO 'bruno'@'localhost' -> dando permissão somente para select e update em todas as tabelas do banco sistemapedidos
   
   REVOKE SELECT ON sistemapedidos.* FROM 'estagiario'@'localhost' -> retirei o acesso ao select
   FLUSH PRIVILEGES -> atualizei as alterações que fiz

   SHOW GRANTS FOR 'estagiario'@'localhost' -> mostra as permissões que o usuário tem

   SET PASSWORD FOR 'estagiario'@'localhost' = '123456' -> altera a senha do usuário
   ALTER USER 'estagiario'@'localhost' PASSWORD EXPIRE -> garantir que quando o usuário acesse o banco, ele altere a senha
   ALTER USER 'estagiario'@'localhost' PASSWORD EXPIRE INTERVAL 15 DAY -> obrigatiriamente trocar a senha em 15 dias
   ```
   Pra testar o usuário eu entrei no phpmyadin e entrei com o usuário criado, e  rodei uma query no phpmyadmin
   
   

