CREATE TABLE Usuario (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    google_id BIGINT UNIQUE NOT NULL,
    data_criacao DATE DEFAULT NOW()
);

CREATE TABLE Ocorrencia(
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    usuario_id INT NOT NULL,
    animal_id INT NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    descricao TEXT NOT NULL,
    foto_url TEXT NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    localizacao GEOMETRY NOT NULL,
    status VARCHAR(20) NOT NULL,
    data_criacao DATE DEFAULT NOW(),
    PRIMARY KEY (id, usuario_id),

    CONSTRAINT fk_usuario FOREIGN KEY (usuario_id) REFERENCES Usuario(id) ON DELETE NO ACTION,
    CONSTRAINT fk_animal FOREIGN KEY (animal_id) REFERENCES Animal(id) ON DELETE NO ACTION,
    CONSTRAINT chk_tipo CHECK (tipo IN ('procura','achado')),
    CONSTRAINT chk_status CHECK (status IN ('ativo','inativo'))
);

CREATE TABLE Animal(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
    especie VARCHAR(50) NOT NULL,
    raca VARCHAR(50) NOT NULL,
    cor VARCHAR(50) NOT NULL

)