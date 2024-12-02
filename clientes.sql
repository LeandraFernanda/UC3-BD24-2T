create  table clientes (
id_clientes int primary key,
nome_clientes varchar (80) not null,
sobrenome_clientes varchar(80) not null
)
create table Produto (
id_produto int primary key,
nome_produto varchar(80)not null,
descricao text null,
preco numeric check (preco > 0) not null,
qtd_estoque smallint default 0
)
create table pedido(
id_pedido serial primary key,
fk_clientes int not null references clientes(id_clientes),
fk_produto int not null,
qtd_estoque smallint not null,
foreign key (fk_produto) references produto(id_produto)
)
insert into clientes (id_clientes, nome_clientes, sobrenome_clientes)
values (1, 'João', 'Silveira'),
 (2, 'Marcelo','Oliveira'),
 (3, 'Isadora', 'Vargas'),
 (4, 'Fernanda','Friedrich'),
 (5, 'Arthur','Ferreira'),
 (6, 'Arthur','Ferreira'),
 (7, 'Arthur','Ferreira'),
 (8, 'Daniel','Ferreira'),
 (9, 'Daniel', 'Ferreira'),
 (10, 'Daniela', 'Bial');

select * from clientes

insert into Produto(id_produto, nome_produto, descricao, preco, qtd_estoque)
values
(1, 'Bola','Bola Colorida',15.00,13),
(2, 'Àgua','Àgua em garrafa de plástico de 1litro',5.00, 52),
(3, 'Sorvete','Sorvete de casca',2.50, 10),
(4, 'Sorvete','Sorvete de copinho',1.50,10),
(5, 'Sorvete', 'Sorvete de 1litro', 10.00,20),
(6, 'Refrigerante','Refrigerante de 600ml',4.00,20),
(7, 'Refrigerante', 'Refrigerante de 1litro',7.00,20),
(8, 'Refrigerante', 'Refrigerante de 2litros',9.50,20),
(9, 'Refrigerante', 'refrigerante de 3litros',11.50,20),
(10, 'Àgua', 'Àgua em garrafa de plástico de 500ml',2.50, 50)

select * from produto

insert into pedido(fk_clientes,fk_produto,qtd)
values (1,2,2),
(1,1,1),
(2,2,1),
(3,3,1),
(4,4,1),
(5,5,1),
(6,6,1),
(7,7,1),
(8,8,1),
(9,9,1),
(10,10,1)
 select * from pedido
