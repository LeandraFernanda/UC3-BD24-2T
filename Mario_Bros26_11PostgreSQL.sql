/* Lógico_1: */

CREATE TABLE Usuarios (
    ID_Usuario56 INTEGER PRIMARY KEY,
    Nome_Usuario__Leandra VARCHAR,
    E_mail__leandrafriedrich_gmail_com VARCHAR,
    Senha__83 VARCHAR
);

CREATE TABLE Jogos (
    ID_Jogo__1234 INTEGER PRIMARY KEY,
    Nome_Jogo VARCHAR (80)  not null,
    Categoria_Jogo VARCHAR (80) not null,
    Data_Lancamento  DATE,
    Personagens VARCHAR(80)  not null
);

CREATE TABLE Partida (
    ID_Partida__54321 INTEGER,
    ID_Jogo__1234 INTEGER,
    ID_Usuario__56 INTEGER,
    Data_Partida__22_10_2024 DATE,
    Pontuacao__0 VARCHAR,
    PRIMARY KEY (ID_Partida__54321, ID_Jogo__1234)
);

CREATE TABLE Rankings (
    ID_Ranking__78965 INTEGER,
    ID_Usuario__56 INTEGER,
    Posicao_no_Ranking__0 VARCHAR,
    Pontuacao__0 VARCHAR,
    PRIMARY KEY (ID_Ranking__78965, ID_Usuario__56)
);

CREATE TABLE Joga (
    fk_Usuario_ID_Usuario56 INTEGER,
    fk_Jogo_ID_Jogo__1234 INTEGER
);

CREATE TABLE ter (
    fk_Jogo_ID_Jogo__1234 INTEGER,
    fk_Partida_ID_Partida__54321 INTEGER,
    fk_Partida_ID_Jogo__1234 INTEGER
);

CREATE TABLE tem (
    fk_Ranking_ID_Ranking__78965 INTEGER,
    fk_Ranking_ID_Usuario__56 INTEGER,
    fk_Partida_ID_Partida__54321 INTEGER,
    fk_Partida_ID_Jogo__1234 INTEGER
);
 
ALTER TABLE Joga ADD CONSTRAINT FK_Joga_1
    FOREIGN KEY (fk_Usuario_ID_Usuario56)
    REFERENCES Usuario (ID_Usuario56)
    ON DELETE SET NULL;
 
ALTER TABLE Joga ADD CONSTRAINT FK_Joga_2
    FOREIGN KEY (fk_Jogo_ID_Jogo__1234)
    REFERENCES Jogo (ID_Jogo__1234)
    ON DELETE SET NULL;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_1
    FOREIGN KEY (fk_Jogo_ID_Jogo__1234)
    REFERENCES Jogo (ID_Jogo__1234)
    ON DELETE SET NULL;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_2
    FOREIGN KEY (fk_Partida_ID_Partida__54321, fk_Partida_ID_Jogo__1234)
    REFERENCES Partida (ID_Partida__54321, ID_Jogo__1234)
    ON DELETE SET NULL;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_1
    FOREIGN KEY (fk_Ranking_ID_Ranking__78965, fk_Ranking_ID_Usuario__56)
    REFERENCES Ranking (ID_Ranking__78965, ID_Usuario__56)
    ON DELETE SET NULL;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_2
    FOREIGN KEY (fk_Partida_ID_Partida__54321, fk_Partida_ID_Jogo__1234)
    REFERENCES Partida (ID_Partida__54321, ID_Jogo__1234)
    ON DELETE SET NULL;