select * from Clientes
select * from Produto
select * from pedido
select * from Categoria

select nome_clientes, qtd from Clientes, pedido
where Clientes.id_Clientes = pedido.fk_Clientes 

--exerc.1
select nome_clientes,qtd from Clientes, pedido
where (Clientes.id_clientes) = (pedido.qtd)

--exerc.2
select fk_clientes,id_pedido  from Clientes, qtd
where (Clientes.nome_produto) = (pedido.qtd)






-- inner join
-- junta id_pedido, id_produto, nome_produto e qtd
select id_pedido, id_produto, nome_produto, qtd
from pedido
join Produto
on Produto.id_produto = Produto.id_produto




create table Categoria(
id_categoria int primary key,
nome_categoria varchar(80)
);

alter table Produto add id_categoria int references Categoria(id_categoria)

insert into Categoria (id_categoria,nome_categoria)
values
(1,'Brinquedo'),
(2,'Bebida')

update Produto set id_categoria = 1 
where id_produto = 1

select nome_produto, nome_categoria 
from Produto full outer join Categoria 
on produto.id_categoria,Categoria.id_categoria --Não deu certo, deu tipo inteiro, tem que ser boolean


--exercicio 1 
/*SELECT Nome_Produto, Nome_Categoria
FROM Produto
[LEFT] JOIN Categoria
ON Produto.ID_Categoria = Categoria.ID_Categoria */

select nome_produto,nome_categoria from Categoria left join Produto 
on Produto.nome_produto = nome_categoria

--exercicio2
/*SELECT Nome_Cliente, ID_Pedido
FROM Cliente
[RIGHT] JOIN Pedido
ON Cliente.ID_Cliente = Pedido.ID_Cliente */

  select nome_clientes, id_pedido
  from pedido
right join clientes
on Clientes.id_clientes = pedido.fk_clientes 

--exercicio3
/*Exemplo: SELECT nome_colunas
FROM nome_tabela1
[CROSS] JOIN nome_tabela2
[WHERE condições]

Selecione todos os produtos e todos os usuários.

SELECT Nome_Produto, Nome_Cliente
FROM Produto
[CROSS] JOIN Cliente */
select nome_produto,id_categoria from Produto
cross join Categoria 
where Produto.id_produto =   'Brinquedo'







--16/12/2024
--View

create or replace view produtos_comprados as 
select PE.id_pedido as pedido, nome_clientes as Clientes, nome_produto as Produto, PE.qtd as quantidade,
PE.qtd*PR.preco as fatura
from pedido PE
join Produto PR
on PE.fk_produto = PR.id_produto
join Clientes CL
on PE.fk_clientes = CL.id_clientes

select * from produtos_comprados
select * from Produto
select * from Categoria
select * from pedido

update produto set id_categoria = 2 where id_produto = 2
update Produto set id_categoria = 3 where id_produto = 4
update Produto set id_categoria = 3 where id_produto = 5
update Produto set id_categoria = 2 where id_produto = 6
update Produto set id_categoria = 2 where id_Produto = 7
update Produto set id_categoria = 2 where id_produto = 8


insert into categoria (id_categoria,nome_categoria)
values(3,'Sorvete')

--exercicio1
create or replace view produtos_categorias as 
select PR.id_produto as Produto, CT.nome_categoria as Categoria,  PE.qtd as quantidade,
PE.qtd * PR.preco as fatura
from Produto PR
on PR.id_categoria = CT.id_categoria



--Indice
create index on Clientes (id_clientes, cpf_clientes)
create index on Produto using hash(id_produto)
create index on pedido using hash (id_pedido)
create index on Clientes using hash (id_clientes)

