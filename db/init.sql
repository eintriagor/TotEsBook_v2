CREATE TABLE IF NOT EXISTS Llibres (
    isbn VARCHAR(20) PRIMARY KEY,
    titol VARCHAR(255) NOT NULL,
    autor VARCHAR(255),
    editorial VARCHAR(255),
    categoria VARCHAR(100),
    sinopsis TEXT,
    imatgeUrl VARCHAR(512)
);
