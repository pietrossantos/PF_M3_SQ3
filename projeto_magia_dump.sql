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
    cpf VARCHAR(14) UNIQUE NOT NULL,
    renda_familiar DECIMAL(10, 2),
    matricula_escolar VARCHAR(32),
    lista_brinquedos VARCHAR(255),
    id_escola INT,
    id_responsavel INT,
    INDEX (nome), -- Adiciona índice na coluna nome
    INDEX (cpf) -- Adiciona índice na coluna cpf
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(15),
    INDEX (nome) -- Adiciona índice na coluna nome
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabela Responsavel: armazena informações sobre os responsáveis
CREATE TABLE Responsavel (
    id_responsavel INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    INDEX (nome), -- Adiciona índice na coluna nome
    INDEX (cpf) -- Adiciona índice na coluna cpf
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
