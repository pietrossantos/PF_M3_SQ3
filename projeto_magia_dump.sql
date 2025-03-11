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
    nome VARCHAR(255),
    endereco VARCHAR(255),
    cnpj VARCHAR(14)
)

--Tabela crianca: armazena informações das criancas
CREATE TABLE crianca(
    id_crianca INT PRIMARY KEY,
    id_responsavel INTEGER,
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
    nome VARCHAR(150),
    data DATE
);

--Tabela apadrinhamento: armazena informações dos apadrinhamento
CREATE TABLE apadrinhamento (
    id_apadrinhamento INT PRIMARY KEY AUTO_INCREMENT,
    id_padrinho INT,
    id_crianca INT,
    id_data_comemorativa INT,
    data_apadrinhamento DATETIME,
    FOREIGN KEY (id_padrinho) REFERENCES padrinho(id_padrinho),
    FOREIGN KEY (id_crianca) REFERENCES crianca(id_crianca),
    FOREIGN KEY (id_data_comemorativa) REFERENCES data_comemorativa(id_data_comemorativa)
)