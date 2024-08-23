-- Criação do banco de dados
create database Biblioteca;
USE Biblioteca;

CREATE TABLE Autores (
    id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    nacionalidade VARCHAR(50));

CREATE TABLE Livros (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    id_autor INT,
    categoria VARCHAR(100),
    data_publicacao DATE,
    FOREIGN KEY (id_autor) REFERENCES Autores(id_autor));

CREATE TABLE Membros (
    id_membro INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_cadastro DATE,
    email VARCHAR(100));

CREATE TABLE Emprestimos (
    id_emprestimo INT PRIMARY KEY AUTO_INCREMENT,
    id_livro INT,
    id_membro INT,
    data_emprestimo DATE,
    data_devolucao DATE,
    FOREIGN KEY (id_livro) REFERENCES Livros(id_livro),
    FOREIGN KEY (id_membro) REFERENCES Membros(id_membro));


CREATE TABLE Categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(100) NOT NULL,
    descricao TEXT,
    data_criacao DATE);

-- Inserção de dados nas tabelas

INSERT INTO Autores (nome, data_nascimento, nacionalidade) VALUES
('J.K. Rowling', '1965-07-31', 'Britânica'),
('George R.R. Martin', '1948-09-20', 'Americana'),
('Collen Hoover', '1979-12-11' , 'Americana'),
('Stephen King' , '1947-08-21' , 'Americnao');



INSERT INTO Livros (titulo, id_autor, categoria, data_publicacao) VALUES
('Harry Potter e a Pedra Filosofal', 1, 'Fantasia', '1997-06-26'),
('A Guerra dos Tronos', 2, 'Fantasia', '1996-08-06'),
('É assim que acaba', 3, 'Drama', '2018-01-18'),
('IT', 4, 'Terror', '1986-09-15');

INSERT INTO Membros (nome, data_cadastro, email) VALUES
('João da Silva', '2023-01-15', 'joao.silva@gmail.com'),
('Maria Oliveira', '2022-03-22', 'maria.oliveira@gmail.com'),
('Nathaly Barbosa', '2024-05-20', 'nat.barbosa@gmail.com'),
('Mariana Souza', '2023-12-13', 'mariana.souza@gmail.com');

INSERT INTO Emprestimos (id_livro, id_membro, data_emprestimo, data_devolucao) VALUES
(1, 1, '2024-08-01', '2024-08-25'),
(2, 2, '2024-08-05', '2024-08-30'),
(3, 1, '2024-08-10', '2024-08-26'),
(4, 4, '2024-08-12', '2024-08-28');

INSERT INTO Categorias (nome_categoria, descricao, data_criacao) VALUES
('Fantasia', 'Livros que contêm elementos mágicos e mundos imaginários.', '2024-01-01'),
('Ficção Científica', 'Livros que exploram conceitos científicos e tecnológicos.', '2024-01-02'),
('Drama', 'Livrosemocionantes do início ao fim.', '2024-01-03'),
('Terror', 'Livros assustadores e com historias horripilantes', '2024-01-02');


-- Criação do banco de dados
create database Biblioteca;
use Biblioteca;

-- Criação da tabela Autores
create table Autores (
    id_autor int primary key auto_increment,
    nome varchar(100) not null,
    data_nascimento date,
    nacionalidade varchar(50)
);

-- Criação da tabela Livros
create table Livros (
    id_livro int primary key auto_increment,
    titulo varchar(255) not null,
    id_autor int,
    categoria varchar(100),
    data_publicacao date,
     foreign key (id_autor) references Autores(id_autor)
);

-- Criação da tabela Membros
create table Membros (
    id_membro int primary key auto_increment,
    nome varchar(100) not null,
    data_cadastro date,
    email varchar(100)
);

-- Criação da tabela Emprestimos
create table Emprestimos (
    id_emprestimo int primary key auto_increment,
    id_livro int,
    id_membro int,
    data_emprestimo date,
    data_devolucao date,
     foreign key (id_livro) references Livros(id_livro),
    foreign key (id_membro) references Membros(id_membro)
);

-- Criação da tabela Categorias
create table Categorias (
    id_categoria int primary key auto_increment,
    nome_categoria varchar(100) not null,
    descricao text,
    data_criacao date);


-- Inserção de dados na tabela Autores
INSERT INTO Autores (nome, data_nascimento, nacionalidade) values
('J.K. Rowling', '1965-07-31', 'Britânica'),
('George R.R. Martin', '1948-09-20', 'Americana');

-- Inserção de dados na tabela Livros
INSERT INTO Livros (titulo, id_autor, categoria, data_publicacao) values
('Harry Potter e a Pedra Filosofal', 1, 'Fantasia', '1997-06-26'),
('A Guerra dos Tronos', 2, 'Fantasia', '1996-08-06');

-- Inserção de dados na tabela Membros
INSERT INTO Membros (nome, data_cadastro, email) values
('João da Silva', '2023-01-15', 'joao.silva@example.com'),
('Maria Oliveira', '2023-03-22', 'maria.oliveira@example.com');

-- Inserção de dados na tabela Emprestimos
INSERT INTO Emprestimos (id_livro, id_membro, data_emprestimo, data_devolucao) values
(1, 1, '2024-08-01', '2024-08-15'),
(2, 2, '2024-08-05', '2024-08-20');

-- Inserção de dados na tabela Categorias
INSERT INTO Categorias (nome_categoria, descricao, data_criacao) values
('Fantasia', 'Livros que contêm elementos mágicos e mundos imaginários.', '2024-01-01'),
('Ficção Científica', 'Livros que exploram conceitos científicos e tecnológicos.', '2024-01-02');


-- Mostrando todo o conteúdo:

select * from Autores;
select * from  Livros;
select * from  Membros;
select * from  Emprestimos;
select * from  Categorias;

-- Exibir livros publicados entre 1990 e 2000

select * from Livros
where data_publicacao between '1990-01-01' and '2000-12-31';

-- Filtragem por valores maiores: 
select * from Membros
where data_cadastro > '2023-01-01';


-- Filtragem por adição de valores:
select id_membro, COUNT(*) as total_emprestimos
from Emprestimos
group by id_membro;

-- Filtragem entre tabelas:
select E.id_emprestimo, L.titulo, M.nome, E.data_emprestimo
from Emprestimos E
join Livros L on E.id_livro = L.id_livro
join Membros M on E.id_membro = M.id_membro;

select * from Livros
where titulo like '%Harry%';





