#-- Cria o banco de dados projeto_magia com conjunto de caracteres e collation UTF-8
CREATE DATABASE projetomagia
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_0900_ai_ci;

#-- Seleciona o banco de dados projeto_magia
USE projetomagia;

#-- Tabela Usuario: armazena informações dos usuários do sistema
CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    email VARCHAR(255) UNIQUE,
    telefone VARCHAR(15),
    cpf VARCHAR(14) NOT NULL,
    idade INTEGER,
    sexo ENUM('Masculino', 'Feminino', 'Outro'),
    tipo_usuario ENUM('padrinho', 'responsavel', 'crianca', 'ADMIN') NOT NULL
);


#-- Tabela padrinho: armazena informações dos padrinhos
CREATE TABLE padrinho(
    id_padrinho INT PRIMARY KEY,
    renda_familiar DECIMAL(10,2),
    motivacao_padrinho TEXT,
    FOREIGN KEY (id_padrinho) REFERENCES usuario(id_usuario)
);

#-- Tabela responsavel: armazena informações dos responsaveis
CREATE TABLE responsavel (
    id_responsavel INT PRIMARY KEY,
    vinculo_crianca VARCHAR(50),
    renda_familiar DECIMAL(10,2) CHECK (renda_familiar >= 0),
    FOREIGN KEY (id_responsavel) REFERENCES usuario(id_usuario) ON DELETE CASCADE
);

#-- Tabela escola: armazena informações das escolas
CREATE TABLE escola (
    id_escola INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255),
    cnpj VARCHAR(14) UNIQUE NOT NULL
);

#-- Tabela crianca: armazena informações das criancas
CREATE TABLE crianca(
    id_crianca INT PRIMARY KEY,
    id_responsavel INTEGER NOT NULL,
    id_escola INTEGER,
    brinquedo_1 VARCHAR(100) NOT NULL,
    brinquedo_2 VARCHAR(100),
    brinquedo_3 VARCHAR(100),
    matricula_escolar VARCHAR(32),
    FOREIGN KEY (id_crianca) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_responsavel) REFERENCES responsavel(id_responsavel),
    FOREIGN KEY (id_escola) REFERENCES escola(id_escola)
);

CREATE TABLE evento (
	id_evento INT PRIMARY KEY AUTO_INCREMENT,
    descricao TEXT,
    data_comemorativa DATE NOT NULL,
    endereco VARCHAR(255),
    cep VARCHAR(50)
);

#-- Tabela apadrinhamento: armazena informações dos apadrinhamento
CREATE TABLE apadrinhamento (
    id_apadrinhamento INT PRIMARY KEY AUTO_INCREMENT,
    id_padrinho INT NOT NULL,
    id_crianca INT NOT NULL,
    id_evento INT NOT NULL,
    data_apadrinhamento DATETIME NOT NULL,
    FOREIGN KEY (id_padrinho) REFERENCES padrinho(id_padrinho),
    FOREIGN KEY (id_crianca) REFERENCES crianca(id_crianca),
    FOREIGN KEY (id_evento) REFERENCES evento(id_evento)
);

CREATE TABLE apadrinhamento_evento (
    id_apadrinhamento_evento INT PRIMARY KEY AUTO_INCREMENT,
    id_apadrinhamento INT NOT NULL,
    id_evento INT NOT NULL,
    FOREIGN KEY (id_evento) REFERENCES evento(id_evento),
    FOREIGN KEY (id_apadrinhamento) REFERENCES apadrinhamento(id_apadrinhamento)
);

INSERT INTO usuario (nome, email, telefone, cpf, idade, sexo, tipo_usuario) VALUES
('Ana Souza', 'ana.souza@email.com', '11999990000', '123.456.789-01', 8, 'Feminino', 'crianca'),
('Carlos Lima', 'carlos.lima@email.com', '11988887777', '123.456.789-02', 13, 'Masculino', 'crianca'),
('Mariana Rocha', 'mariana.rocha@email.com', '11977776666', '123.456.789-03', 22, 'Feminino', 'padrinho'),
('Bruno Santos', 'bruno.santos@email.com', '11966665555', '123.456.789-04', 35, 'Masculino', 'padrinho'),
('Fernanda Alves', 'fernanda.alves@email.com', '11955554444', '123.456.789-05', 42, 'Feminino', 'padrinho'),
('Ricardo Mendes', 'ricardo.mendes@email.com', '11944443333', '123.456.789-06', 60, 'Masculino', 'padrinho'),
('Juliana Costa', 'juliana.costa@email.com', '11933332222', '123.456.789-07', 12, 'Feminino', 'crianca'),
('Eduardo Martins', 'eduardo.martins@email.com', '11922221111', '123.456.789-08', 29, 'Masculino', 'padrinho'),
('Patricia Silva', 'patricia.silva@email.com', '11911110000', '123.456.789-09', 6, 'Feminino', 'crianca'),
('Roberto Nunes', 'roberto.nunes@email.com', '11900009999', '123.456.789-10', 33, 'Masculino', 'padrinho'),
('Carla Ferreira', 'carla.ferreira@email.com', '11899998888', '123.456.789-11', 48, 'Feminino', 'padrinho'),
('André Ribeiro', 'andre.ribeiro@email.com', '11888887777', '123.456.789-12', 13, 'Masculino', 'crianca'),
('Tatiane Oliveira', 'tatiane.oliveira@email.com', '11877776666', '123.456.789-13', 24, 'Feminino', 'padrinho'),
('Lucas Rocha', 'lucas.rocha@email.com', '11866665555', '123.456.789-14', 5, 'Masculino', 'crianca'),
('Aline Campos', 'aline.campos@email.com', '11855554444', '123.456.789-15', 70, 'Feminino', 'padrinho'),
('Felipe Souza', 'felipe.souza@email.com', '11844443333', '123.456.789-16', 30, 'Masculino', 'padrinho'),
('Isabela Mendes', 'isabela.mendes@email.com', '11833332222', '123.456.789-17', 28, 'Feminino', 'responsavel'),
('Gustavo Almeida', 'gustavo.almeida@email.com', '11822221111', '123.456.789-18', 14, 'Masculino', 'crianca'),
('Natália Duarte', 'natalia.duarte@email.com', '11811110000', '123.456.789-19', 26, 'Feminino', 'responsavel'),
('Vinícius Barros', 'vinicius.barros@email.com', '11800009999', '123.456.789-20', 34, 'Masculino', 'responsavel'),
('Luana Martins', 'luana.martins@email.com', '11799998888', '123.456.789-21', 27, 'Feminino', 'responsavel'),
('Rafael Costa', 'rafael.costa@email.com', '11788887777', '123.456.789-22', 10, 'Masculino', 'crianca'),
('Bianca Fernandes', 'bianca.fernandes@email.com', '11777776666', '123.456.789-23', 25, 'Feminino', 'responsavel'),
('Leandro Vasconcelos', 'leandro.vasconcelos@email.com', '11766665555', '123.456.789-24', 55, 'Masculino', 'responsavel'),
('Camila Ribeiro', 'camila.ribeiro@email.com', '11755554444', '123.456.789-25', 30, 'Feminino', 'responsavel'),
('Douglas Pereira', 'douglas.pereira@email.com', '11744443333', '123.456.789-26', 32, 'Masculino', 'responsavel'),
('Renata Azevedo', 'renata.azevedo@email.com', '11733332222', '123.456.789-27', 13, 'Feminino', 'crianca'),
('Fábio Oliveira', 'fabio.oliveira@email.com', '11722221111', '123.456.789-28', 36, 'Masculino', 'responsavel'),
('Tatiane Gomes', 'tatiane.gomes@email.com', '11711110000', '123.456.789-29', 7, 'Feminino', 'crianca'),
('Pedro Henrique', 'pedro.henrique@email.com', '11700009999', '123.456.789-30', 33, 'Masculino', 'responsavel'),
('Letícia Nogueira', 'leticia.nogueira@email.com', '11699998888', '123.456.789-31', 50, 'Feminino', 'responsavel'),
('Jonas Carvalho', 'jonas.carvalho@email.com', '11688887777', '123.456.789-32', 31, 'Masculino', 'responsavel'),
('Vanessa Lima', 'vanessa.lima@email.com', '11677776666', '123.456.789-33', 24, 'Feminino', 'responsavel'),
('Alexandre Batista', 'alexandre.batista@email.com', '11666665555', '123.456.789-34', 45, 'Masculino', 'responsavel'),
('Bruna Farias', 'bruna.farias@email.com', '11655554444', '123.456.789-35', 28, 'Feminino', 'responsavel'),
('Maurício Rocha', 'mauricio.rocha@email.com', '11644443333', '123.456.789-36', 9, 'Masculino', 'crianca'),
('Débora Souza', 'debora.souza@email.com', '11633332222', '123.456.789-37', 26, 'Feminino', 'responsavel'),
('Thiago Almeida', 'thiago.almeida@email.com', '11622221111', '123.456.789-38', 32, 'Masculino', 'responsavel'),
('Simone Ribeiro', 'simone.ribeiro@email.com', '11611110000', '123.456.789-39', 60, 'Feminino', 'responsavel'),
('Rodrigo Mendes', 'rodrigo.mendes@email.com', '11600009999', '123.456.789-40', 34, 'Masculino', 'responsavel');

INSERT INTO padrinho (id_padrinho, renda_familiar) VALUES
    (3, 5000.00), 
    (4, 7000.00), 
    (5, 6000.00), 
    (6, 8000.00), 
    (8, 7500.00), 
    (10, 6500.00), 
    (11, 7200.00), 
    (13, 5000.00), 
    (15, 9000.00), 
    (16, 6800.00);

INSERT INTO responsavel (id_responsavel, vinculo_crianca, renda_familiar) VALUES
    (17, 'Mãe', 4500.00), 
    (19, 'Pai', 5500.00), 
    (20, 'Avó', 4000.00), 
    (21, 'Tio', 4800.00), 
    (23, 'Mãe', 5000.00), 
    (24, 'Pai', 6000.00), 
    (25, 'Mãe', 7500.00), 
    (26, 'Pai', 6700.00), 
    (28, 'Avô', 6200.00), 
    (30, 'Mãe', 7100.00);

INSERT INTO escola (nome, endereco, cnpj) VALUES
('Escola Primária Alegria', 'Rua das Flores, 123', '12345678000101'),
('Colégio Integração', 'Av. Central, 456', '22345678000102'),
('Escola Nova Esperança', 'Rua da Paz, 789', '32345678000103'),
('Instituto Saber', 'Praça das Árvores, 101', '42345678000104'),
('Colégio Evolução', 'Alameda dos Estudantes, 202', '52345678000105');

INSERT INTO crianca (id_crianca, id_responsavel, id_escola, brinquedo_1, brinquedo_2, brinquedo_3, matricula_escolar) VALUES
(1, 17, 1, 'Boneca', 'Quebra-cabeça', 'Jogo da memória', 'MAT2024001'),
(2, 19, 2, 'Carrinho', 'Bola', 'LEGO', 'MAT2024002'),
(7, 21, 3, 'Urso de pelúcia', 'Livro infantil', 'Dominó', 'MAT2024003'),
(9, 23, 4, 'Cubo mágico', 'Bicicleta', 'Jogo de tabuleiro', 'MAT2024004'),
(14, 25, 5, 'Carrinho de controle remoto', 'Boneco de ação', 'Pista de corrida', 'MAT2024005'),
(18, 28, 1, 'Jogo de cartas', 'Lego', 'Bola de futebol', 'MAT2024006'),
(22, 30, 2, 'Quebra-cabeça', 'Jogo de xadrez', 'Patins', 'MAT2024007'),
(27, 19, 3, 'Slime', 'Bola de basquete', 'Livro de colorir', 'MAT2024008'),
(29, 17, 4, 'Boneca Barbie', 'Massinha', 'Corda de pular', 'MAT2024009'),
(36, 23, 5, 'Pipa', 'Ferrorama', 'Patinete', 'MAT2024010');

INSERT INTO evento (descricao, data_comemorativa, endereco, cep) VALUES
('Festa de Natal para as crianças', '2025-12-25', 'Rua Principal, 123', '12345-678'),
('Celebração do Dia das Crianças', '2025-10-12', 'Avenida Central, 456', '54321-876'),
('Evento de Páscoa com caça aos ovos', '2025-04-20', 'Praça da Matriz, 789', '98765-432'),
('Festa de Carnaval com fantasias', '2025-02-25', 'Rua Lateral, 101', '10101-202'),
('Entrega de presentes de Natal', '2025-12-25', 'Rua Secundaria, 202', '20202-303'),
('Tarde de jogos dia das crianças', '2025-10-12', 'Rua Sem Saída, 303', '30303-404'),
('Almoço especial de Páscoa', '2025-04-20', 'Rua dos Bobos, 0', '40404-505'),
('Desfile de Carnaval', '2025-02-25', 'Rua da Alegria, 505', '50505-606'),
('Apresentação de coral natalino', '2025-12-25', 'Rua da Música, 606', '60606-707'),
('Piquenique do Dia das Crianças', '2025-10-12', 'Parque Central, 707', '70707-808');

INSERT INTO apadrinhamento (id_padrinho, id_crianca, id_evento, data_apadrinhamento) VALUES
(3, 1, 1, '2024-12-25 10:00:00'),
(4, 2, 2, '2024-10-12 15:00:00'),
(5, 7, 3, '2024-04-20 11:30:00'),
(6, 9, 4, '2024-02-25 14:00:00'),
(8, 14, 1, '2024-12-25 16:00:00'),
(10, 18, 2, '2024-10-12 09:00:00'),
(11, 22, 3, '2024-04-20 13:00:00'),
(13, 27, 4, '2024-02-25 17:00:00'),
(15, 29, 1, '2024-12-25 12:00:00'),
(16, 36, 2, '2024-10-12 18:00:00');

INSERT INTO apadrinhamento_evento (id_apadrinhamento, id_evento) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);


#-- COMEÇANDO AS CONSULTAS
USE projetomagia

SELECT * FROM apadrinhamento_evento

SELECT DISTINCT sexo, COUNT (sexo) as quantidade_sexo
    FROM usuario
    GROUP BY sexo;

SELECT DISTINCT vinculo_crianca AS responsavel, COUNT (vinculo_crianca) as quantidade_por_responsavel
    FROM responsavel
    GROUP BY vinculo_crianca;

SELECT usuario.nome, COUNT(crianca.id_crianca)
    FROM responsavel
    INNER JOIN usuario ON responsavel.id_responsavel = usuario.id_usuario
    INNER JOIN crianca ON crianca.id_responsavel = responsavel.id_responsavel
    GROUP BY responsavel.id_responsavel;