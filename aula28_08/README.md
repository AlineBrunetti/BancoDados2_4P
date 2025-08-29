Atomicidade - só executa se estiver certo, se der erro em algum momento ele desfaz tudo que havia feito
Consistencia - sempre mantem o mesmo padrao, repetição, estado do banco de dados, se é valido e nao existe erro ele mantem a conscistencia, se tiver erro nao executa e nao tem conscistencia

transection- (COMIT É NECESSARIO) eu consigo validar tudo que acontece no banco de dados vizualmente e se tiver ok,  comita tudo que rolou, se tiver problema ele da um rollback, garante que as infos vao estar la e nao vao ser perdidas
propriedades das transaction - Atomicidade, Consistência, Isolamento e Durabilidade.


objetivo da aula é executar na pratica automicidade e transection 
-------

```SQL
use bibliotecadb;
SELECT * FROM livro;
SELECT * FROM usuario;
SELECT * FROM emprestimo;
```

Pra saber se o commit ta ligado (quando transection não precisa de commit)
```SQL
SELECT @@autocommit;
```

Vamos desligar o autocommit
```SQL
SET @@autocommit = off;
```

Vamos começar a transaction - garante que se tiver algo errado consegue voltar
```SQL
START TRANSACTION;
```

Inserir os itens no emprestimo 
```SQL
INSERT INTO emprestimo(usuario_id, livro_id, data_emprestimo) values
(1,1,curdate());
```

Usuário paga
```SQL
update usuario SET saldo = saldo - 10
where id = 1;
```

Atualizar o estoque
```SQL
update livro SET disponivel = FALSE
where id = 3;
```

Nossa consistencia ta fudida pq nao validamos o estoque, os cara pode emprestar o mesmo livro sem ele estar la
```SQL
ROLLBACK
```
