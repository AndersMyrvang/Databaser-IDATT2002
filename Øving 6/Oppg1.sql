-- Drop existing tables if they exist
DROP TABLE IF EXISTS rull;
DROP TABLE IF EXISTS stoff;
DROP TABLE IF EXISTS ordreProdukt;
DROP TABLE IF EXISTS ordre;
DROP TABLE IF EXISTS kunde;
DROP TABLE IF EXISTS Produkt_ordinar;
DROP TABLE IF EXISTS arbeidsstasjon;
DROP TABLE IF EXISTS del;
DROP TABLE IF EXISTS produkt_spesial;

-- Table 4: arbeidsstasjon
CREATE TABLE arbeidsstasjon (
    id INT PRIMARY KEY,
    plassering VARCHAR(255)
);

-- Table 6: stoff
CREATE TABLE stoff (
    stoff_id INT PRIMARY KEY,
    navn VARCHAR(255),
    farge VARCHAR(255),
    pris DECIMAL(10, 2),
    beskrivelse VARCHAR(255)
);

-- Table 7: del
CREATE TABLE del (
    stasjon_id INT,
    del_id INT PRIMARY KEY,
    navn VARCHAR(255),
    farge VARCHAR(255),
    pris DECIMAL(10, 2),
    beskrivelse TEXT,
    stoff_id INT,
    FOREIGN KEY (stasjon_id) REFERENCES arbeidsstasjon(id),
    FOREIGN KEY (stoff_id) REFERENCES stoff(stoff_id)
);

-- Table 2: Produkt-ordinÃ¦r
CREATE TABLE Produkt_ordinar (
    modell_id INT PRIMARY KEY,
    ordre_id INT,
    pris DECIMAL(10, 2),
    betaling VARCHAR(255),
    FOREIGN KEY (ordre_id) REFERENCES ordre(ordreID)
);

-- Table 3: produkt-spesial
CREATE TABLE produkt_spesial (
    del1_id INT,
    del2_id INT,
    del3_id INT,
    ordre_id INT,
    betaling VARCHAR(255),
    FOREIGN KEY (del1_id) REFERENCES del(del_id),
    FOREIGN KEY (del2_id) REFERENCES del(del_id),
    FOREIGN KEY (del3_id) REFERENCES del(del_id),
    FOREIGN KEY (ordre_id) REFERENCES ordre(ordreID)
);

-- Table 5: rull
CREATE TABLE rull (
    id INT PRIMARY KEY,
    stoffid INT,
    lengde DECIMAL(10, 2),
    FOREIGN KEY (stoffid) REFERENCES stoff(stoff_id)
);

-- Table 1: kunde
CREATE TABLE kunde (
    kundeID INT PRIMARY KEY,
    ordre_id INT,
    navn VARCHAR(255),
    adresse VARCHAR(255),
    FOREIGN KEY (ordre_id) REFERENCES ordre(ordreID)
);

-- Table 8: ordre
CREATE TABLE ordre (
    ordreID INT PRIMARY KEY,
    dato_bestilling DATE,
    Ant_levdato DATE,
    kunde_id INT,
    Produkt VARCHAR(255),
    rabatt DECIMAL(10, 2),
    FOREIGN KEY (kunde_id) REFERENCES kunde(kundeID)
);

-- Table 9: ordreProdukt
CREATE TABLE ordreProdukt (
    ordre_id INT,
    stol_type VARCHAR(255),
    antall INT,
    FOREIGN KEY (ordre_id) REFERENCES ordre(ordreID)
);