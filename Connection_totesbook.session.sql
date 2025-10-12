CREATE TABLE Usuaris (
    dni CHAR(9) PRIMARY KEY,
    nom VARCHAR(50),
    cognoms VARCHAR(100),
    adreca VARCHAR(150),
    telefon VARCHAR(15),
    correu VARCHAR(100)
);

INSERT INTO Usuaris (dni, nom, cognoms, adreca, telefon, correu) VALUES
('12345678A', 'Jordi', 'Martí Pérez', 'Carrer Major 12, Barcelona', '612345678', 'jordi.marti@example.com'),
('87654321B', 'Anna', 'López Serra', 'Av. Catalunya 45, Girona', '698765432', 'anna.lopez@example.com');

CREATE TABLE Llibres (
    isbn CHAR(13) PRIMARY KEY,
    titol VARCHAR(100),
    autor VARCHAR(100),
    editorial VARCHAR(100),
    categoria VARCHAR(50)
);

INSERT INTO Llibres (isbn, titol, autor, editorial, categoria) VALUES
('9788499890944', 'L’ombra del vent', 'Carlos Ruiz Zafón', 'Planeta', 'Novela'),
('9788437604947', 'Tirant lo Blanc', 'Joanot Martorell', 'Edicions 62', 'Classic');

SELECT * FROM Llibres;
SELECT * FROM Usuaris;

