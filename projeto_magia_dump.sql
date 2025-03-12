-- Cria o banco de dados projeto_magia com conjunto de caracteres e collation UTF-8
CREATE DATABASE projeto_magia
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_0900_ai_ci;

-- Seleciona o banco de dados projeto_magia
USE projeto_magia;

-- Tabela Usuario: armazena informações dos usuários do sistema
CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    email VARCHAR(255) UNIQUE,
    telefone VARCHAR(15),
    cpf VARCHAR(14) NOT NULL,
    idade INTEGER,
    sexo VARCHAR(15)
);


--Tabela padrinho: armazena informações dos padrinhos
CREATE TABLE padrinho(
    id_padrinho INT PRIMARY KEY,
    renda_familiar DECIMAL(10,2),
    FOREIGN KEY (id_padrinho) REFERENCES usuario(id_usuario)
);

--Tabela responsavel: armazena informações dos responsaveis
CREATE TABLE responsavel (
    id_responsavel INT PRIMARY KEY,
    vinculo_crianca VARCHAR(50),
    renda_familiar decimal(10,2),
    FOREIGN KEY (id_responsavel) REFERENCES usuario(id_usuario)
);

--Tabela escola: armazena informações das escolas
CREATE TABLE escola (
    id_escola INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255),
    cnpj VARCHAR(14) NOT NULL
);

--Tabela crianca: armazena informações das criancas
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

--Tabela data_comemorativa: armazena informações das datas comemorativas
CREATE TABLE data_comemorativa (
    id_data_comemorativa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL ,
    data DATE NOT NULL
);

--Tabela apadrinhamento: armazena informações dos apadrinhamento
CREATE TABLE apadrinhamento (
    id_apadrinhamento INT PRIMARY KEY AUTO_INCREMENT,
    id_padrinho INT NOT NULL,
    id_crianca INT NOT NULL,
    id_data_comemorativa INT NOT NULL,
    data_apadrinhamento DATETIME NOT NULL,
    FOREIGN KEY (id_padrinho) REFERENCES padrinho(id_padrinho),
    FOREIGN KEY (id_crianca) REFERENCES crianca(id_crianca),
    FOREIGN KEY (id_data_comemorativa) REFERENCES data_comemorativa(id_data_comemorativa)
);

INSERT INTO usuario (nome, email, telefone, cpf, idade, sexo) VALUES
('Ana Souza', 'ana.souza@email.com', '11999990000', '123.456.789-01', 8, 'Feminino'),
('Carlos Lima', 'carlos.lima@email.com', '11988887777', '123.456.789-02', 15, 'Masculino'),
('Mariana Rocha', 'mariana.rocha@email.com', '11977776666', '123.456.789-03', 22, 'Feminino'),
('Bruno Santos', 'bruno.santos@email.com', '11966665555', '123.456.789-04', 35, 'Masculino'),
('Fernanda Alves', 'fernanda.alves@email.com', '11955554444', '123.456.789-05', 42, 'Feminino'),
('Ricardo Mendes', 'ricardo.mendes@email.com', '11944443333', '123.456.789-06', 60, 'Masculino'),
('Juliana Costa', 'juliana.costa@email.com', '11933332222', '123.456.789-07', 12, 'Feminino'),
('Eduardo Martins', 'eduardo.martins@email.com', '11922221111', '123.456.789-08', 29, 'Masculino'),
('Patricia Silva', 'patricia.silva@email.com', '11911110000', '123.456.789-09', 6, 'Feminino'),
('Roberto Nunes', 'roberto.nunes@email.com', '11900009999', '123.456.789-10', 33, 'Masculino'),
('Carla Ferreira', 'carla.ferreira@email.com', '11899998888', '123.456.789-11', 48, 'Feminino'),
('André Ribeiro', 'andre.ribeiro@email.com', '11888887777', '123.456.789-12', 16, 'Masculino'),
('Tatiane Oliveira', 'tatiane.oliveira@email.com', '11877776666', '123.456.789-13', 24, 'Feminino'),
('Lucas Rocha', 'lucas.rocha@email.com', '11866665555', '123.456.789-14', 5, 'Masculino'),
('Aline Campos', 'aline.campos@email.com', '11855554444', '123.456.789-15', 70, 'Feminino'),
('Felipe Souza', 'felipe.souza@email.com', '11844443333', '123.456.789-16', 30, 'Masculino'),
('Isabela Mendes', 'isabela.mendes@email.com', '11833332222', '123.456.789-17', 28, 'Feminino'),
('Gustavo Almeida', 'gustavo.almeida@email.com', '11822221111', '123.456.789-18', 14, 'Masculino'),
('Natália Duarte', 'natalia.duarte@email.com', '11811110000', '123.456.789-19', 26, 'Feminino'),
('Vinícius Barros', 'vinicius.barros@email.com', '11800009999', '123.456.789-20', 34, 'Masculino'),
('Luana Martins', 'luana.martins@email.com', '11799998888', '123.456.789-21', 27, 'Feminino'),
('Rafael Costa', 'rafael.costa@email.com', '11788887777', '123.456.789-22', 10, 'Masculino'),
('Bianca Fernandes', 'bianca.fernandes@email.com', '11777776666', '123.456.789-23', 25, 'Feminino'),
('Leandro Vasconcelos', 'leandro.vasconcelos@email.com', '11766665555', '123.456.789-24', 55, 'Masculino'),
('Camila Ribeiro', 'camila.ribeiro@email.com', '11755554444', '123.456.789-25', 30, 'Feminino'),
('Douglas Pereira', 'douglas.pereira@email.com', '11744443333', '123.456.789-26', 32, 'Masculino'),
('Renata Azevedo', 'renata.azevedo@email.com', '11733332222', '123.456.789-27', 13, 'Feminino'),
('Fábio Oliveira', 'fabio.oliveira@email.com', '11722221111', '123.456.789-28', 36, 'Masculino'),
('Tatiane Gomes', 'tatiane.gomes@email.com', '11711110000', '123.456.789-29', 7, 'Feminino'),
('Pedro Henrique', 'pedro.henrique@email.com', '11700009999', '123.456.789-30', 33, 'Masculino'),
('Letícia Nogueira', 'leticia.nogueira@email.com', '11699998888', '123.456.789-31', 50, 'Feminino'),
('Jonas Carvalho', 'jonas.carvalho@email.com', '11688887777', '123.456.789-32', 31, 'Masculino'),
('Vanessa Lima', 'vanessa.lima@email.com', '11677776666', '123.456.789-33', 24, 'Feminino'),
('Alexandre Batista', 'alexandre.batista@email.com', '11666665555', '123.456.789-34', 45, 'Masculino'),
('Bruna Farias', 'bruna.farias@email.com', '11655554444', '123.456.789-35', 28, 'Feminino'),
('Maurício Rocha', 'mauricio.rocha@email.com', '11644443333', '123.456.789-36', 9, 'Masculino'),
('Débora Souza', 'debora.souza@email.com', '11633332222', '123.456.789-37', 26, 'Feminino'),
('Thiago Almeida', 'thiago.almeida@email.com', '11622221111', '123.456.789-38', 32, 'Masculino'),
('Simone Ribeiro', 'simone.ribeiro@email.com', '11611110000', '123.456.789-39', 60, 'Feminino'),
('Rodrigo Mendes', 'rodrigo.mendes@email.com', '11600009999', '123.456.789-40', 34, 'Masculino');

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

INSERT INTO data_comemorativa (nome, data) VALUES
('Natal', '2025-12-25'),
('Dia das Crianças', '2025-10-12'),
('Páscoa', '2025-04-20'),
('Dia dos Pais', '2025-08-10'),
('Dia das Mães', '2025-05-11'),
('Ano Novo', '2025-01-01'),
('Dia do Professor', '2025-10-15'),
('Independência do Brasil', '2025-09-07'),
('Carnaval', '2025-02-25'),
('Dia do Trabalho', '2025-05-01');


-- Seleciona o nome do padrinho, email, telefone, idade, sexo e rendamiliar unindo com a tabela usuario
SELECT padrinho.id_padrinho, usuario.nome, usuario.email, usuario.telefone, usuario.idade, usuario.sexo, padrinho.renda_familiar FROM padrinho
    INNER JOIN usuario ON padrinho.id_padrinho = usuario.id_usuario;

