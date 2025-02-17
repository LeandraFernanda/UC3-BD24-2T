
create table Team(
ID_Team integer primary key,
Name varchar(80) not null

);

alter table Team add column fk_Match integer references Match (ID_Match) 
select * from Team

create table Player(
ID_Player integer primary key,
Level integer not null,
Score integer not null,
Region varchar(80) not null,
User_name varchar(80) not null
);
select * from Player
alter table Team add column fk_Team integer references Team(ID_Team)


create table Player_Match_Game(
Player_Points integer,
Teams_Points integer,
Player integer,
Match integer
--foreign key(Player) references Player(ID_Player),
--foreign key(Match) references Match(ID_Match)
);
alter table Player_Match_Game drop column player --apagar uma coluna
alter table Player_Match_Game drop column fk_player --apagar uma coluna
alter table Player_Match_Game add column fk_Player integer references Player(ID_Player)
alter table Player_Match_Game add column fk_Match integer  references Match(ID_Match)

select * from Player_Match_Game

create table Match(
ID_Match integer primary key,
Results numeric,
Duration time,
Date_Time Date,
Champion integer
--foreign key(Match) references Champion(ID_Champion)
);

alter table Match add column fk_Match integer references Champion(ID_Champion)

select * from Match

create table Item(
ID_Item integer primary key,
Cost numeric,
Description varchar(100) not null,
Effect varchar(100) not null,
Name varchar(80) not null,
Match integer
--foreign key(Match) references Match(ID_Match)
);
alter table Match add column fk_Match integer references Match(ID_Match)

select * from Item

create table Champion(
ID_Champion integer primary key,
Name varchar(80) not null,
Ability varchar(80) not null,
Damage_Type varchar(80) not null,
Function varchar(80) not null,
Player integer
--foreign key(Player) references Player(ID_Player)
);
alter table Champion add column fk_Player integer references Player(ID_Player)

select * from Champion

create table Offensive(
Phisyc_Damage numeric,
Magic_Damage numeric,
Item integer
--foreign key(Item) references Item(ID_Item)
);
alter table Offensive add column fk_Item integer references Item(ID_Item)

select * from Offensive

create table Defensive(
Armor numeric,
Res_Magic numeric,
Item integer
--foreign key(Item) references Item(ID_Item)
);
alter table Defensive add column fk_Item integer references Item(ID_Item)

select * from Defensive

create table Consumable(
Potion numeric,
Item integer
--foreign key(Item) references Item(ID_Item)
);
alter table Consumable add column fk_Item integer references Item(ID_Item)

select * from Consumable

insert into Team (Name) values
('Sem Cabeças')

insert into Player (ID_Player,Level,Score,Region, User_name)
values(1, 1, 500, 'O Vazio', 'Jenaro Kaio' ),
(2, 1, 500,'Noxus','Oswaldinato' ),
(3, 2, 700, 'Ixtal','Jonatão' ),
(4, 1, 500, 'Ilhas das Sombras','Nailton Suzuki' ),
(5, 4, 1500, 'Shurima','Joan Duru')



INSERT INTO Player_Match_Game (id_player, results, duration)
VALUES
    (1, 800, 120),
    (2, 750, 240),
    (3, 800, 240),
    (4, 1000, 480),
    (5, 1500, 960);
	
insert into Champion(ID_Champion,Name,Ability,Damage_Type,Function)
values(5,'Joan Duru','Ágil','Físico','Correr'),
(4,'Nailton Suzuki', 'Correr', 'Impacto','Correr'),
(3, 'Jonatão', 'Mágico', 'Corte','Saltar'),
(2,'Oswaldinato','Arcanos','Físico','Saltar'),
(1,'Jenaro Kaio','Correr','Dançar','Dançar')

insert into Offensive(Phisyc_Damage,Magic_Damage)
values(5,10),(1,5),(10,5),(5,1),(0,1)

insert into Defensive(Armor, Res_Magic)
values(1,1),(1,2),(1,3),(1,4),(1,5)

insert into Consumable(Potion, Item)
values(5,1),(2,2),(1,4),(3,5),(4,2)

insert into Item(ID_Item,Cost,Description,Effect,Name)
values(1, 10,'Poção de energia','Brilha','Poção'),
(2,20,'Espada Cortante','corta','Espada'),
(3,30,'Bloom','varios efeitos', 'Bloom'),
(4, 40,'Poção de Pular','Pula', 'Poção'),
(5,50,'Dançar todas as musicas','rebolar','Dançar')



select * from Partida


-CREATE OR REPLACE VIEW Partida AS
SELECT
    m.ID_Match,
    m.Results,
    m.Duration,
    m.Date_Time,
    c.Name AS ChampionName,
    c.Ability AS ChampionAbility
FROM
    Match m
JOIN
    Champion c ON m.champion = ID_Match;-- "partida" não é uma visão, não sei o que quer dizer isso.


CREATE OR REPLACE VIEW Jogador AS
SELECT
    p.ID_Player,
    p.User_name,
    p.Level,
    p.Score,
    pmg.Player_Points,
    pmg.Teams_Points,
    m.Date_Time AS MatchDate
FROM
    Player p
JOIN
    Player_Match_Game pmg ON p.ID_Player = p.ID_Player
JOIN
    Match m ON p.ID_Player = m.ID_Match;


-CREATE OR REPLACE VIEW Times AS
SELECT
    t.Name AS TeamName,
    p.User_name AS User_Name,
    p.Level,
    p.Score
FROM
    Team t
JOIN
    Player p ON p.ID_Player = p.User_Name; -- Nenhum operador corresponde ao nome e tipo de dados dos argumentos fornecidos. Talvez seja necessário adicionar uma conversão de tipo de dados explícita.operador não existe: integer = character varying, não entendi .  



-CREATE OR REPLACE VIEW Jogador AS
SELECT
    p.ID_Player,
    p.User_Name,
    p.Level,
    p.Score,
    m.Date_Time AS MatchDate
FROM
    Player p
JOIN
    Player_Match_Game pmg ON p.ID_Player = p.User_Name 
JOIN
    Match m ON p.ID_Player = m.ID_Match;

	select * from Jogador



CREATE OR REPLACE VIEW Times AS
SELECT
    t.Name AS TeamName,
    p.User_name,
    p.Level,
    p.Score
FROM
    Team t
JOIN
    Player p ON p.User_name = t.ID_Team; 

	select * from Times




CREATE INDEX idx_player_username ON Player (User_name);


CREATE INDEX idx_match_datetime ON Match (Date_Time);


CREATE INDEX idx_champion_name ON Champion (Name);


CREATE INDEX idx_player_match ON Player_Match_Game ( Player_Points);


CREATE INDEX idx_item_name ON Item (Name);

	
