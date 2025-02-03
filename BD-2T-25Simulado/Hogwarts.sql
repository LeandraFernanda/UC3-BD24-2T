create table Hogwarts 

CREATE TABLE casa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);
select * from casa

CREATE TABLE personagem (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    data_nascimento DATE,
    casa_id INT,
    FOREIGN KEY (casa_id) REFERENCES casa(id)
);
select * from personagem

CREATE TABLE materia (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);
select * from materia

CREATE TABLE professor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    materia_id INT,
    FOREIGN KEY (materia_id) REFERENCES materia(id)
);
select * from professor

CREATE TABLE feitico (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT
);
select * from feitico

CREATE TABLE personagem_feitico (
    personagem_id INT,
    feitico_id INT,
    PRIMARY KEY (personagem_id, feitico_id),
    FOREIGN KEY (personagem_id) REFERENCES personagem(id),
    FOREIGN KEY (feitico_id) REFERENCES feitico(id)
);
select * from personagem_feitico

INSERT INTO casa (nome) VALUES ('Grifinória'), ('Sonserina'), ('Corvinal'), ('Lufa-Lufa');
INSERT INTO Personagem (nome_personagem, data_nascimento, id_casa) VALUES
('Harry Potter', '31-07-1980', 1),
('Hermione Granger', '19-09-1979', 1),
('Rony Weasley', '01-03-1980', 1),
('Draco Malfoy', '05-06-1980', 2);

INSERT INTO Materia (nome_materia) VALUES
('Poção'),
('Feitiços'),
('Transfiguração'),
('Passadeira');

INSERT INTO Professor (nome_professor, id_materia) VALUES
('Severo Snape', 1),
('Fílio Flitwick', 2),
('Minerva McGonagall', 3),
('Remo Lupin', 4);

INSERT INTO Feitico (nome_feitico, descricao_feitico) VALUES
('Expelliarmus', 'Desarma o oponente'),
('Wingardium Leviosa', 'Faz levitar objetos'),
('Alohomora', 'Abre fechaduras'),
('Petrificus Totalus', 'Petrifica o oponente');

INSERT INTO Personagem_Materia (id_personagem, id_materia) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3),
(3, 1);

SELECT p.nome_personagem, c.nome_casa
FROM Personagem p
JOIN Casa c ON p.id_casa = c.id_casa;

SELECT p.nome_personagem
FROM Personagem p
JOIN Casa c ON p.id_casa = c.id_casa
WHERE c.nome_casa = 'Grifinória';

CREATE VIEW personagens_grifinoria AS
SELECT nome_personagem, data_nascimento
FROM Personagem
WHERE id_casa = (SELECT id_casa FROM Casa WHERE nome_casa = 'Grifinória');

CREATE INDEX idx_nome ON Personagem (nome_personagem);

SELECT nome_personagem
FROM personagens_grifinoria
WHERE data_nascimento > '01-01-1990';

SELECT p.nome_personagem, m.nome_materia
FROM Personagem p
    JOIN Personagem_Materia pm ON p.id_personagem = pm.id_personagem
    JOIN Materia m ON pm.id_materia = m.id_materia

    WHERE p.nome_personagem = 'Harry Potter';
    
SELECT p.nome_personagem, f.nome_feitico
FROM Personagem p
    JOIN Personagem_Feitico pf ON p.id_personagem = pf.id_personagem
    JOIN Feitico f ON pf.id_feitico = f.id_feitico

   