-- Opprett CREATE TABLE -setninger i din egen database i MySQL der du definerer
-- primær- og fremmednøkler slik du er kommet fram til i de innledende oppgavene.

CREATE TABLE
    Borettslag (
        Borettslag_ID INT PRIMARY KEY,
        Navn VARCHAR(255) NOT NULL,
        Adresse VARCHAR(255) NOT NULL,
        Antall_hus_blokker INT,
        Etableringsaar INT
    );

CREATE TABLE
    Bygninger (
        Bygning_ID INT PRIMARY KEY,
        Borettslag_ID INT,
        Antall_etasjer INT,
        Antall_leiligheter INT,
        FOREIGN KEY (Borettslag_ID) REFERENCES Borettslag (Borettslag_ID)
    );

CREATE TABLE
    Andelseiere (
        Andelseier_ID INT PRIMARY KEY,
        Borettslag_ID INT,
        Navn VARCHAR(255) NOT NULL,
        Eierskap_start_dato DATE,
        Eierskap_slutt_dato DATE,
        Er_leietaker BOOLEAN,
        FOREIGN KEY (Borettslag_ID) REFERENCES Borettslag (Borettslag_ID)
    );

CREATE TABLE
    Leiligheter (
        Leilighet_ID INT PRIMARY KEY,
        Bygning_ID INT,
        Andelseier_ID INT,
        Antall_rom INT,
        Antall_kvadratmeter DECIMAL(6,3),
        Etasje INT,
        Leilighetsnummer INT,
        FOREIGN KEY (Bygning_ID) REFERENCES Bygninger (Bygning_ID),
        FOREIGN KEY (Andelseier_ID) REFERENCES Andelseiere (Andelseier_ID)
    );

-- Lag INSERT-setninger der du legger inn noen gyldige (test-)data i tabellene. Lag også
-- INSERT-setninger som gir brudd på entitets- og referanseintegritetsreglene.


-- gyldige insert
INSERT INTO
    Borettslag (
        Borettslag_ID,
        Navn,
        Adresse,
        Antall_hus_blokker,
        Etableringsaar
    )
VALUES
    (1, 'Test Borettslag', 'Testveien 1', 3, 2000),
    (2, 'Another Borettslag', 'Gategate 1', 2, 1990);

INSERT INTO
    Bygninger (
        Bygning_ID,
        Borettslag_ID,
        Antall_etasjer,
        Antall_leiligheter
    )
VALUES
    (101, 1, 5, 20),
    (102, 1, 4, 15),
    (103, 2, 6, 25);

INSERT INTO
    Andelseiere (
        Andelseier_ID,
        Borettslag_ID,
        Navn,
        Eierskap_start_dato,
        Eierskap_slutt_dato,
        Er_leietaker
    )
VALUES
    (201, 1, 'Erlend Eier', '2020-01-01', NULL, 0),
    (202, 1, 'Elias Eksempel', '2018-05-15', NULL, 1),
    (203, 2, 'Heihei Heihei', '2019-08-20', NULL, 0);

INSERT INTO
    Leiligheter (Leilighet_ID, Bygning_ID, Andelseier_ID, Antall_rom, Antall_kvadratmeter, Etasje, Leilighetsnummer)
VALUES
    (1001, 101, 201, 3, 75.5, 2, 203),
    (1002, 101, 202, 4, 90.0, 3, 305),
    (1003, 102, 202, 2, 60.0, 1, 102),
    (1004, 103, 203, 5, 110.5, 4, 402);





--ugyldige insert
--Prøver å legge til et ekstra borettslag med primary key 1, duplisert fremmednøkkel  
INSERT INTO
    Borettslag (
        Borettslag_ID,
        Navn,
        Adresse,
        Antall_hus_blokker,
        Etableringsaar
    )
VALUES
    (
        1,
        'Invalid Borettslag',
        'Invalid Street 789',
        1,
        2015
    );

-- Prøver å sette inn en Bygning med en ikke-eksisterende Borettslag_ID
INSERT INTO
    Bygninger (
        Bygning_ID,
        Borettslag_ID,
        Antall_etasjer,
        Antall_leiligheter
    )
VALUES
    (104, 3, 3, 12);
