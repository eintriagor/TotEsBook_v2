CREATE TABLE IF NOT EXISTS Llibres (
    isbn VARCHAR(20) PRIMARY KEY,
    titol VARCHAR(255) NOT NULL,
    autor VARCHAR(255),
    editorial VARCHAR(255),
    categoria VARCHAR(100)
);

INSERT INTO Llibres (isbn, titol, autor, editorial, categoria) VALUES
('978-0261103573', 'El Senyor dels Anells', 'J. R. R. Tolkien', 'Minotauro', 'Fantasia'),
('978-8497592208', 'Cien años de soledad', 'Gabriel García Márquez', 'Debolsillo', 'Realismo mágico'),
('978-0451524935', '1984', 'George Orwell', 'Signet Classics', 'Distopía'),
('978-8437604947', 'Don Quijote de la Mancha', 'Miguel de Cervantes', 'Cátedra', 'Clásico'),
('978-0140449266', 'La Odisea', 'Homero', 'Penguin Classics', 'Épico'),
('978-0307476463', 'El nombre del viento', 'Patrick Rothfuss', 'DAW Books', 'Fantasía');
