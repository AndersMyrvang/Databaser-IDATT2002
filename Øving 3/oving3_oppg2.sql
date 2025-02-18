--Oppgave 1, 
SELECT
    oh.ordrenr,
    oh.dato,
    oh.levnr,
    oh.status,
    od.delnr,
    di.beskrivelse,
    od.kvantum
FROM
    ordrehode oh
    JOIN ordredetalj od ON oh.ordrenr = od.ordrenr
    JOIN delinfo di ON od.delnr = di.delnr
WHERE
    oh.levnr = 44;

--Oppgave 2,
SELECT
    li.navn,
    li.levby
FROM
    levinfo li
    JOIN prisinfo pi ON li.levnr = pi.levnr
WHERE
    pi.delnr = 1;

--Oppgave 3,
SELECT
    li.levnr,
    li.navn,
    pi.pris
FROM
    levinfo li
    JOIN prisinfo pi ON li.levnr = pi.levnr
WHERE
    pi.delnr = 201
ORDER BY
    pi.pris
LIMIT
    1;

--Oppgave 4,
SELECT
    oh.ordrenr,
    oh.dato,
    od.delnr,
    di.beskrivelse,
    od.kvantum,
    pi.pris,
    (od.kvantum * pi.pris) AS beregnet_belop
FROM
    ordrehode oh
    JOIN ordredetalj od ON oh.ordrenr = od.ordrenr
    JOIN delinfo di ON od.delnr = di.delnr
    JOIN prisinfo pi ON od.delnr = pi.delnr
    AND oh.levnr = pi.levnr
WHERE
    oh.ordrenr = 16;

--Oppgave5,
SELECT
    pi.delnr,
    pi.levnr
FROM
    prisinfo pi
    JOIN prisinfo pi_x7770 ON pi_x7770.delnr = 'X7770'
WHERE
    pi.pris > pi_x7770.pris;

--Oppgave6,
CREATE TABLE
    byfylke (
        byen VARCHAR(20),
        fylke VARCHAR(20),
        CONSTRAINT byfylke_pk PRIMARY KEY (byen)
    );

INSERT INTO
    byfylke (byen, fylke)
SELECT DISTINCT
    levby,
    fylke
FROM
    levinfo;

SELECT
    *
FROM
    byfylke
    --Oppgave 6,
CREATE TABLE
    levinfo2 (
        levnr INTEGER,
        navn VARCHAR(20) NOT NULL,
        adresse VARCHAR(20),
        levby VARCHAR(20) NOT NULL,
        postnr INTEGER NOT NULL,
        CONSTRAINT levinfo2_pk PRIMARY KEY (levnr),
        CONSTRAINT levinfo2_fk FOREIGN KEY (levby) REFERENCES byfylke (byen)
    );

INSERT INTO
    levinfo2 (levnr, navn, adresse, levby, postnr)
SELECT
    levnr,
    navn,
    adresse,
    levby,
    postnr
FROM
    levinfo;

SELECT
    *
FROM
    levinfo2;

--Oppgave 6,
CREATE VIEW levview
AS
SELECT l.levnr,l.navn,l.adresse,l.levby,b.fylke,l.postnr
FROM levinfo2 l, byfylke b
WHERE l.levby = b.byen;
SELECT * FROM levview; 

--Oppgave 7,
SELECT DISTINCT levby FROM levinfo WHERE levby NOT IN (
 SELECT levby FROM prisinfo, levinfo WHERE prisinfo.levnr = levinfo.levnr);

--Oppgave 8,


