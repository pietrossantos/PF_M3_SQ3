-- Cria o banco de dados projeto_magia com conjunto de caracteres e collation UTF-8
CREATE DATABASE projeto_magia
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_0900_ai_ci;

-- Seleciona o banco de dados projeto_magia
USE projeto_magia;

-- Tabela Usuario: armazena informações dos usuários do sistema
CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(180) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    tipo_usuario VARCHAR(20) NOT NULL,
    id_crianca INT,
    id_responsavel INT,
    INDEX (nome), -- Adiciona índice na coluna nome
    INDEX (email), -- Adiciona índice na coluna email
    INDEX (tipo_usuario) -- Adiciona índice na coluna tipo_usuario
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
ALTER TABLE Usuario
ADD FOREIGN KEY (id_padrinho) REFERENCES Padrinho(id_padrinho);
ALTER TABLE Usuario
ADD FOREIGN KEY (id_responsavel) REFERENCES Responsavel(id_responsavel);
DESCRIBE Usuario;
-- Adiciona a restrição CHECK para validar o tipo de usuário
ALTER TABLE Usuario ADD CHECK (tipo_usuario IN ('padrinho', 'responsavel', 'administrador', 'outros'));

-- Tabela Apadrinhamento: armazena informações sobre os apadrinhamentos
CREATE TABLE Apadrinhamento (
    id_apadrinhamento INT AUTO_INCREMENT PRIMARY KEY,
    data_apadrinhamento DATETIME NOT NULL,
    id_crianca INT NOT NULL,
    id_padrinho INT NOT NULL,
    id_datas_comemorativas INT NOT NULL,
    INDEX (data_apadrinhamento) -- Adiciona índice na coluna data_apadrinhamento
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabela Crianca: armazena informações sobre as crianças
CREATE TABLE Crianca (
    id_crianca INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    cpf CHAR(14) UNIQUE NOT NULL,
    renda_familiar DECIMAL(10, 2),
    matricula_escolar VARCHAR(32),
    lista_brinquedos TEXT,
    id_escola INT,
    id_responsavel INT,
    INDEX (nome), -- Adiciona índice na coluna nome
    INDEX (cpf) -- Adiciona índice na coluna cpf
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE Crianca
ADD UNIQUE (matricula_escolar);
ALTER TABLE Crianca
MODIFY COLUMN cpf CHAR(14) UNIQUE;
ALTER TABLE Crianca
MODIFY COLUMN lista_brinquedos TEXT; 

-- Tabela Padrinho: armazena informações sobre os padrinhos
CREATE TABLE Padrinho (
    id_padrinho INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(180) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    INDEX (nome), -- Adiciona índice na coluna nome
    INDEX (email) -- Adiciona índice na coluna email
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabela Escola: armazena informações sobre as escolas
CREATE TABLE Escola (
    id_escola INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    telefone VARCHAR(15),
    INDEX (nome) -- Adiciona índice na coluna nome
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabela Responsavel: armazena informações sobre os responsáveis
CREATE TABLE Responsavel (
    id_responsavel INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf CHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    INDEX (nome), -- Adiciona índice na coluna nome
    INDEX (cpf) -- Adiciona índice na coluna cpf
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE Responsavel
MODIFY COLUMN cpf CHAR(14) UNIQUE;
-- Tabela Datas_comemorativas: armazena informações sobre as datas comemorativas
CREATE TABLE Datas_comemorativas (
    id_datas_comemorativas INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    data DATE NOT NULL,
    INDEX (nome), -- Adiciona índice na coluna nome
    INDEX (data) -- Adiciona índice na coluna data
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Adiciona chaves estrangeiras com ON DELETE e ON UPDATE
ALTER TABLE Usuario ADD FOREIGN KEY (id_crianca) REFERENCES Crianca(id_crianca) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE Usuario ADD FOREIGN KEY (id_responsavel) REFERENCES Responsavel(id_responsavel) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE Apadrinhamento ADD FOREIGN KEY (id_crianca) REFERENCES Crianca(id_crianca) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Apadrinhamento ADD FOREIGN KEY (id_padrinho) REFERENCES Padrinho(id_padrinho) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Apadrinhamento ADD FOREIGN KEY (id_datas_comemorativas) REFERENCES Datas_comemorativas(id_datas_comemorativas) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Crianca ADD FOREIGN KEY (id_escola) REFERENCES Escola(id_escola) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE Crianca ADD FOREIGN KEY (id_responsavel) REFERENCES Responsavel(id_responsavel) ON DELETE SET NULL ON UPDATE CASCADE;


-- Insere dados fictícios na tabela Usuario
INSERT INTO Usuario (nome, email, telefone, tipo_usuario) VALUES
('Ana Silva', 'ana.silva@email.com', '(11) 91111-1111', 'padrinho'),
('Bruno Oliveira', 'bruno.oliveira@email.com', '(21) 92222-2222', 'responsavel'),
('Carla Santos', 'carla.santos@email.com', '(31) 93333-3333', 'administrador'),
('Daniel Pereira', 'daniel.pereira@email.com', '(41) 94444-4444', 'outros'),
('Eduarda Rodrigues', 'eduarda.rodrigues@email.com', '(51) 95555-5555', 'padrinho'),
('Felipe Costa', 'felipe.costa@email.com', '(61) 96666-6666', 'responsavel'),
('Gabriela Souza', 'gabriela.souza@email.com', '(71) 97777-7777', 'administrador'),
('Henrique Almeida', 'henrique.almeida@email.com', '(81) 98888-8888', 'outros'),
('Isabela Fernandes', 'isabela.fernandes@email.com', '(91) 99999-9999', 'padrinho'),
('João Barbosa', 'joao.barbosa@email.com', '(12) 91010-1010', 'responsavel'),
('Karina Ribeiro', 'karina.ribeiro@email.com', '(22) 91212-1212', 'administrador'),
('Lucas Cavalcanti', 'lucas.cavalcanti@email.com', '(32) 91313-1313', 'outros'),
('Manuela Dias', 'manuela.dias@email.com', '(42) 91414-1414', 'padrinho'),
('Nathan Castro', 'nathan.castro@email.com', '(52) 91515-1515', 'responsavel'),
('Olivia Gomes', 'olivia.gomes@email.com', '(62) 91616-1616', 'administrador'),
('Pedro Martins', 'pedro.martins@email.com', '(72) 91717-1717', 'outros'),
('Rafaela Rocha', 'rafaela.rocha@email.com', '(82) 91818-1818', 'padrinho'),
('Samuel Correia', 'samuel.correia@email.com', '(92) 91919-1919', 'responsavel'),
('Talita Cunha', 'talita.cunha@email.com', '(13) 92020-2020', 'administrador'),
('Victor Barros', 'victor.barros@email.com', '(23) 92121-2121', 'outros'),
('Yasmin Lima', 'yasmin.lima@email.com', '(33) 92222-2222', 'padrinho'),
('André Melo', 'andre.melo@email.com', '(43) 92323-2323', 'responsavel'),
('Beatriz Nogueira', 'beatriz.nogueira@email.com', '(53) 92424-2424', 'administrador'),
('César Campos', 'cesar.campos@email.com', '(63) 92525-2525', 'outros'),
('Débora Freitas', 'debora.freitas@email.com', '(73) 92626-2626', 'padrinho'),
('Enzo Batista', 'enzo.batista@email.com', '(83) 92727-2727', 'responsavel'),
('Fernanda Vieira', 'fernanda.vieira@email.com', '(93) 92828-2828', 'administrador'),
('Gustavo Santana', 'gustavo.santana@email.com', '(14) 92929-2929', 'outros'),
('Helena Cardoso', 'helena.cardoso@email.com', '(24) 93030-3030', 'padrinho'),
('Ítalo Aragão', 'italo.aragao@email.com', '(34) 93131-3131', 'responsavel'),
('Júlia Peixoto', 'julia.peixoto@email.com', '(44) 93232-3232', 'administrador'),
('Kevin Siqueira', 'kevin.siqueira@email.com', '(54) 93333-3333', 'outros'),
('Larissa Aguiar', 'larissa.aguiar@email.com', '(64) 93434-3434', 'padrinho'),
('Matheus Dourado', 'matheus.dourado@email.com', '(74) 93535-3535', 'responsavel'),
('Nicole Valente', 'nicole.valente@email.com', '(84) 93636-3636', 'administrador'),
('Otávio Pires', 'otavio.pires@email.com', '(94) 93737-3737', 'outros'),
('Patrícia Brandão', 'patricia.brandao@email.com', '(15) 93838-3838', 'padrinho'),
('Ricardo Xavier', 'ricardo.xavier@email.com', '(25) 93939-3939', 'responsavel'),
('Sofia Leal', 'sofia.leal@email.com', '(35) 94040-4040', 'administrador'),
('Thiago Maia', 'thiago.maia@email.com', '(45) 94141-4141', 'outros'),
('Valentina Nunes', 'valentina.nunes@email.com', '(55) 94242-4242', 'padrinho'),
('Wagner Mourão', 'wagner.mourao@email.com', '(65) 94343-4343', 'responsavel'),
('Xênia Viana', 'xenia.viana@email.com', '(75) 94444-4444', 'administrador'),
('Yuri Gusmão', 'yuri.gusmao@email.com', '(85) 94545-4545', 'outros'),
('Zara Lemos', 'zara.lemos@email.com', '(95) 94646-4646', 'padrinho'),
('Alessandra Paiva', 'alessandra.paiva@email.com', '(16) 94747-4747', 'responsavel'),
('Bernardo Rangel', 'bernardo.rangel@email.com', '(26) 94848-4848', 'administrador'),
('Camila Porto', 'camila.porto@email.com', '(36) 94949-4949', 'outros'),
('Diego Saraiva', 'diego.saraiva@email.com', '(46) 95050-5050', 'padrinho'),
('Emanuelle Dantas', 'emanuelle.dantas@email.com', '(56) 95151-5151', 'responsavel'),
('Fabrício Brito', 'fabricio.brito@email.com', '(66) 95252-5252', 'administrador'),
('Giovanna Cunha', 'giovanna.cunha@email.com', '(76) 95353-5353', 'outros'),
('Hugo Farias', 'hugo.farias@email.com', '(86) 95454-5454', 'padrinho');
SELECT * FROM usuario;

-- Agrupa os usuarios a partir de seu tipo e diz a quantidade de cada tipo de usuario
SELECT tipo_usuario, COUNT(tipo_usuario) AS quantidade_por_tipos_usuarios
    FROM usuario GROUP BY tipo_usuario;

INSERT INTO escola (nome, endereco, telefone, id_escola) VALUES
('Escola A', 'Rua A, 123', '(11) 1111-1111', 1),
('Escola B', 'Rua B, 456', '(22) 2222-2222', 2),
('Escola C', 'Rua C, 789', '(33) 3333-3333', 3),
('Escola D', 'Rua D, 012', '(44) 4444-4444', 4),
('Escola E', 'Rua E, 345', '(55) 5555-5555', 5),
('Escola F', 'Rua F, 678', '(66) 6666-6666', 6),
('Escola G', 'Rua G, 901', '(77) 7777-7777', 7),
('Escola H', 'Rua H, 234', '(88) 8888-8888', 8),
('Escola I', 'Rua I, 567', '(99) 9999-9999', 9),
('Escola J', 'Rua J, 890', '(10) 1010-1010', 10),
('Escola K', 'Rua K, 234', '(11) 1111-1111', 11),
('Escola L', 'Rua L, 567', '(12) 1212-1212', 12),
('Escola M', 'Rua M, 890', '(13) 1313-1313', 13),
('Escola N', 'Rua N, 234', '(14) 1414-1414', 14),
('Escola O', 'Rua O, 567', '(15) 1515-1515', 15),
('Escola P', 'Rua P, 890', '(16) 1616-1616', 16),
('Escola Q', 'Rua Q, 234', '(17) 1717-1717', 17),
('Escola R', 'Rua R, 567', '(18) 1818-1818', 18),
('Escola S', 'Rua S, 890', '(19) 1919-1919', 19),
('Escola T', 'Rua T, 234', '(20) 2020-2020', 20);

INSERT INTO Padrinho (nome, email, telefone, id_padrinho) VALUES
('Ana Silva', 'ana.silva@email.com', '(11) 91111-1111', 1),
('Eduarda Rodrigues', 'eduarda.rodrigues@email.com', '(51) 95555-5555', 2),
('Isabela Fernandes', 'isabela.fernandes@email.com', '(91) 99999-9999', 3),
('Manuela Dias', 'manuela.dias@email.com', '(42) 91414-1414', 4),
('Rafaela Rocha', 'rafaela.rocha@email.com', '(82) 91818-1818', 5),
('Yasmin Lima', 'yasmin.lima@email.com', '(33) 92222-2222', 6),
('Débora Freitas', 'debora.freitas@email.com', '(73) 92626-2626', 7),
('Helena Cardoso', 'helena.cardoso@email.com', '(24) 93030-3030', 8),
('Larissa Aguiar', 'larissa.aguiar@email.com', '(64) 93434-3434', 9),
('Patrícia Brandão', 'patricia.brandao@email.com', '(15) 93838-3838', 10),
('Valentina Nunes', 'valentina.nunes@email.com', '(55) 94242-4242', 11),
('Diego Saraiva', 'diego.saraiva@email.com', '(46) 95050-5050', 12),
('Hugo Farias', 'hugo.farias@email.com', '(86) 95454-5454', 13);

INSERT INTO Responsavel (nome, cpf, telefone, id_responsavel) VALUES
('Bruno Oliveira', '111.222.333-44', '(21) 92222-2222', 1),
('Felipe Costa', '555.666.777-88', '(61) 96666-6666', 2),
('João Barbosa', '999.000.111-22', '(12) 91010-1010', 3),
('Nathan Castro', '333.444.555-66', '(52) 91515-1515', 4),
('Samuel Correia', '777.888.999-00', '(92) 91919-1919', 5),
('André Melo', '222.333.444-55', '(43) 92323-2323', 6),
('Enzo Batista', '666.777.888-99', '(83) 92727-2727', 7),
('Ítalo Aragão', '000.111.222-33', '(34) 93131-3131', 8),
('Matheus Dourado', '444.555.666-77', '(74) 93535-3535', 9),
('Ricardo Xavier', '888.999.000-11', '(25) 93939-3939', 10),
('Wagner Mourão', '123.456.789-00', '(65) 94343-4343', 11),
('Alessandra Paiva', '567.890.123-45', '(16) 94747-4747', 12),
('Emanuelle Dantas', '901.234.567-89', '(56) 95151-5151', 13);

ALTER TABLE Responsavel ADD COLUMN email VARCHAR(180) UNIQUE;

UPDATE Responsavel SET email = 'bruno.oliveira@email.com' WHERE id_responsavel = 1;
UPDATE Responsavel SET email = 'felipe.costa@email.com' WHERE id_responsavel = 2;
UPDATE Responsavel SET email = 'joao.barbosa@email.com' WHERE id_responsavel = 3;
UPDATE Responsavel SET email = 'nathan.castro@email.com' WHERE id_responsavel = 4;
UPDATE Responsavel SET email = 'samuel.correia@email.com' WHERE id_responsavel = 5;
UPDATE Responsavel SET email = 'andre.melo@email.com' WHERE id_responsavel = 6;
UPDATE Responsavel SET email = 'enzo.batista@email.com' WHERE id_responsavel = 7;
UPDATE Responsavel SET email = 'italo.aragao@email.com' WHERE id_responsavel = 8;
UPDATE Responsavel SET email = 'matheus.dourado@email.com' WHERE id_responsavel = 9;
UPDATE Responsavel SET email = 'ricardo.xavier@email.com' WHERE id_responsavel = 10;
UPDATE Responsavel SET email = 'wagner.mourao@email.com' WHERE id_responsavel = 11;
UPDATE Responsavel SET email = 'alessandra.paiva@email.com' WHERE id_responsavel = 12;
UPDATE Responsavel SET email = 'emanuelle.dantas@email.com' WHERE id_responsavel = 13;

UPDATE Usuario
JOIN Responsavel ON Usuario.email = Responsavel.email
SET Usuario.id_responsavel = Responsavel.id_responsavel
WHERE Usuario.tipo_usuario = 'responsavel';

SELECT Usuario.nome, Responsavel.telefone
FROM Usuario
JOIN Responsavel ON Usuario.id_responsavel = Responsavel.id_responsavel
WHERE Usuario.tipo_usuario = 'responsavel';
UPDATE Usuario
JOIN Padrinho ON Usuario.email = Padrinho.email
SET Usuario.id_padrinho = Padrinho.id_padrinho
WHERE Usuario.tipo_usuario = 'padrinho';
-- Mostra nome e contato dos padrinhos
SELECT Usuario.nome, Padrinho.telefone
FROM Usuario
JOIN Padrinho ON Usuario.id_padrinho = Padrinho.id_padrinho
WHERE Usuario.tipo_usuario = 'padrinho';