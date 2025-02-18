-- Opprett tabellen stoltype
CREATE TABLE stoltype (
    typenavn VARCHAR(50) PRIMARY KEY
);

-- Opprett tabellen modell
CREATE TABLE modell (
    modell VARCHAR(50) PRIMARY KEY,
    typenavn VARCHAR(50),
    FOREIGN KEY (typenavn) REFERENCES stoltype(typenavn)
);

-- Opprett tabellen produksjonsstol
CREATE TABLE produksjonsstol (
    stolnr INT PRIMARY KEY,
    modell VARCHAR(50),
    FOREIGN KEY (modell) REFERENCES modell(modell)
);

-- Opprett tabellen standardstol
CREATE TABLE standardstol (
    stolnr INT PRIMARY KEY,
    pris DECIMAL(10, 2),
    ant_på_lager INT
);

-- Opprett tabellen bestilling
CREATE TABLE bestilling (
    ordrenr INT PRIMARY KEY,
    stolnr INT,
    antall INT,
    stoff_deltypenr INT,
    rullnr INT,
    FOREIGN KEY (stolnr) REFERENCES standardstol(stolnr),
    FOREIGN KEY (stoff_deltypenr, rullnr) REFERENCES stoff(stoff_deltypenr, rullnr)
);

-- Opprett tabellen ordre
CREATE TABLE ordre (
    ordrenr INT PRIMARY KEY,
    ordredato DATE,
    antatt_levdato DATE,
    reell_levdato DATE,
    rabatt DECIMAL(5, 2),
    leveringsstatus VARCHAR(20),
    kundenr INT,
    FOREIGN KEY (kundenr) REFERENCES kunde(kundenr)
);

-- Opprett tabellen kunde
CREATE TABLE kunde (
    kundenr INT PRIMARY KEY,
    kundenavn VARCHAR(100),
    kundeadresse VARCHAR(255)
);

-- Opprett tabellen spesialstol
CREATE TABLE spesialstol (
    stolnr INT PRIMARY KEY,
    deltypenr INT,
    rullnr INT,
    FOREIGN KEY (deltypenr, rullnr) REFERENCES stoff(stoff_deltypenr, rullnr)
);

-- Opprett tabellen deltype
CREATE TABLE deltype (
    deltypenr INT PRIMARY KEY,
    navn VARCHAR(100),
    farge VARCHAR(50),
    pris DECIMAL(10, 2)
);

-- Opprett tabellen ordinær_del
CREATE TABLE ordinær_del (
    deltypenr INT PRIMARY KEY,
    ant_på_lager INT,
    stoffbehov INT
);

-- Opprett tabellen stoff
CREATE TABLE stoff (
    deltypenr INT,
    rullnr INT,
    PRIMARY KEY (deltypenr, rullnr)
);

-- Opprett tabellen sammensetning
CREATE TABLE sammensetning (
    deltypenr INT,
    stolnr INT,
    antall INT,
    status VARCHAR(20),
    PRIMARY KEY (deltypenr, stolnr),
    FOREIGN KEY (deltypenr) REFERENCES deltype(deltypenr),
    FOREIGN KEY (stolnr) REFERENCES produksjonsstol(stolnr)
);

-- Opprett tabellen arbeidsstasjon
CREATE TABLE arbeidsstasjon (
    arbst_nr INT PRIMARY KEY,
    arbst_navn VARCHAR(100),
    plassering VARCHAR(100),
    informasjon VARCHAR(255)
);
