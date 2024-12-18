create table Personagem(
id_personagem int primary key,
nome_personagem varchar(30)
);


insert into Personagem(id_personagem,nome_personagem)
values
(1, 'Aragorn(Passolargo)'),
(2, 'Legolas(Elfo)'),
(3, 'Gimli'),
(4, 'Gandalf(O Cinzento)'),
(5, 'Frodo Bolseiro'),
(6, 'Sauron'),
(7, 'Boromir');

select * from Personagem



create table Item(
id_item int primary key,
nome_item varchar(50),
valor int
);

insert into Item(id_item,nome_item,valor)
values
(1,'Espada Elfica', 500),
(2,'Arco Longo',300),
(3,'Machado de Batalha',400),
(4,'Varinha Mágica',600),
(5,'Espada Anduril',700),
(6,'Espada Glamdring',800),
(7,'Anel',1000);


ALTER TABLE Item ADD valor int

select * from Item 







create table Cenario( 
id_cenario int primary key,
nome_cenario varchar(80) not null
)

insert into Cenario(id_cenario,nome_cenario)
values
(1,'Floresta de Lothlórien'),
(2,'Montanhas de Moria'),
(3,'Campo de Batalha de Helm'),
(4,'A casa de Bilbo e Frodo Bolseiro'),
(5,'O vale dos elfos');

select * from Cenario



create table Coletados(
id_personagem int,
id_item int,
id_cenario int,
primary key (id_personagem, id_item, id_cenario),
FOREIGN KEY (id_personagem) REFERENCES Personagem(id_personagem),
FOREIGN KEY (id_item) REFERENCES Item(id_item),
FOREIGN KEY (id_cenario) REFERENCES Cenario(id_cenario)
);


insert into Coletados (id_personagem, id_item, id_cenario)
values
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 1),
(1, 3, 3),
(2, 1, 1);
select *  from Coletados



--09/12/2024
-- encontrar itens coletados por Aragorn
select Coletados.id_item, nome_item from Coletados,Item
where Coletados.id_item =Item.id_item and id_personagem = 1

--descobrir os cenários que Legolas visitou
select Cenario.id_cenario, nome_cenário from Cenario
where Cenario.id_



--verificar os itens coletados por gimli no Campo de Batalha de Helm



--somar o valor dos itens coletados no cenário "Floresta de Lothlórien"
select * from Personagem




--inner join
select Coletados.id_item, nome_item 
from Coletados,Item
join Coletados
on Coletados.id_item =Item.id_item and id_personagem = 1