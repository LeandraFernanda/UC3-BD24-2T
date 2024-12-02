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
values 
 (4, 'Fernanda','Friedrich'),
 (5, 'Arthur','Ferreira'),
 (6, 'Arthur','Ferreira'),
 (7, 'Arthur','Ferreira'),
 (8, 'Daniel','Ferreira'),
 (9, 'Daniel', 'Ferreira'),
 (10, 'Daniela', 'Bial')

select * from clientes

insert into Produto(id_produto, nome_produto, descricao, preco, qtd_estoque)
values
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

(4,4,1),
(5,5,1),
(6,6,1),
(7,7,1),
(8,8,1),
(9,9,1),
(10,10,1)


 select * from pedido
select * from clientes

select distinct nome_clientes from clientes
select distinct sobrenome_clientes from clientes

alter table clientes add genero_clientes varchar(20),
alter table clientes add salario_clientes money 
/* Manipulação de registro na tabela/relação clientes:*/
alter table clientes alter column cpf_clientes type varchar(11)

update clientes  SET cpf_clientes = null

update clientes set genero_clientes = 'masculino'

update clientes set genero_clientes = 'feminino' where id_clientes = 3 
update clientes set genero_clientes = 'feminino' where id_clientes = 4
update clientes set genero_clientes = 'feminino' where id_clientes = 10

update clientes set salario_clientes = 'R$ 1.412,00'
update clientes set salario_clientes = 'R$ 1.500,00' where id_clientes = 3
update clientes set salario_clientes = 'R$ 1.500,00' where id_clientes = 4
update clientes set salario_clientes = 'R$ 1.500,00' where id_clientes = 10

update clientes set cpf_clientes = '00000000000' where id_clientes = 1
update clientes set cpf_clientes = '11111111111' where id_clientes = 2
update clientes set cpf_clientes = '22222222222' where id_clientes = 3
update clientes set cpf_clientes = '33333333333' where id_clientes = 4
update clientes set cpf_clientes = '44444444444' where id_clientes = 5
update clientes set cpf_clientes = '55555555555' where id_clientes = 6
update clientes set cpf_clientes = '66666666666' where id_clientes = 7
update clientes set cpf_clientes = '77777777777' where id_clientes = 8
update clientes set cpf_clientes = '88888888888' where id_clientes = 9
update clientes set cpf_clientes = '99999999999' where id_clientes = 10
/* coloca em ordem alfabética*/
SELECT * FROM clientes ORDER BY nome_clientes ASC

/* o ultimo vira o primeiro e vai decrescendo*/
SELECT * FROM clientes ORDER BY nome_clientes DESC
/* seleciona o nome e o salario mostrando quem ganha menos de 3.000*/
select nome_clientes,salario_clientes from clientes where genero_clientes = 'masculino' and salario_clientes <'3.000'



