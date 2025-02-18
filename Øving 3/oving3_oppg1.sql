--Oppgave 1, finne alle borettslag som er etablert  ellom 1975 og 1985
SELECT
    *
FROM
    borettslag
WHERE
    etabl_aar BETWEEN 1975 AND 1985;

    

--Oppgave 2, 
SELECT
    CONCAT (fornavn, ' ', etternavn) AS andelseier_info,
    CONCAT ('ansiennitet: ', ansiennitet, ' år') AS ansiennitet_info
FROM
    andelseier
ORDER BY
    ansiennitet DESC;

--Oppgave 3, eldste etableringsår
SELECT
    MIN(etabl_aar) AS eldste_borettslag_etablert
FROM
    borettslag;

--Oppgave 4, Finn adressene til alle bygninger som inneholder leiligheter med minst tre rom.
SELECT DISTINCT
    bygning.bygn_adr
FROM
    bygning
    JOIN leilighet ON bygning.bygn_id = leilighet.bygn_id
WHERE
    leilighet.ant_rom >= 3;

--Oppgave 5,
SELECT
    COUNT(*) AS antall_bygninger_i_Tertitten
FROM
    bygning
WHERE
    bolag_navn = 'Tertitten';

--Oppgave 6,
SELECT
    borettslag.bolag_navn,
    COUNT(bygning.bolag_navn) AS antall_bygninger
FROM
    borettslag
    LEFT JOIN bygning ON borettslag.bolag_navn = bygning.bolag_navn
GROUP BY
    borettslag.bolag_navn
ORDER BY
    borettslag.bolag_navn;

--Oppgave 7, Finn antall leiligheter i borettslaget "Tertitten".
SELECT
    COUNT(*) AS antall_leiligheter_i_Tertitten
FROM
    leilighet
    JOIN bygning ON leilighet.bygn_id = bygning.bygn_id
WHERE
    bygning.bolag_navn = 'Tertitten';

--Oppgave 8,
SELECT
    MAX(etasje) AS høyeste_etasje_i_Tertitten
FROM
    leilighet
    JOIN bygning ON leilighet.bygn_id = bygning.bygn_id
WHERE
    bygning.bolag_navn = 'Tertitten';

--Oppgave 9,
SELECT
    fornavn,
    etternavn,
    and_eier_nr
FROM
    andelseier
    LEFT JOIN leilighet ON andelseier.and_eier_nr = leilighet.and_eier_nr
WHERE
    leilighet.and_eier_nr IS NULL;

--Oppgave 10,
SELECT
    borettslag.bolag_navn,
    COUNT(andelseier.and_eier_nr) AS antall_andelseiere
FROM
    borettslag
    LEFT JOIN andelseier ON borettslag.bolag_navn = andelseier.bolag_navn
GROUP BY
    borettslag.bolag_navn
ORDER BY
    antall_andelseiere DESC;

--Oppgave 11,
SELECT
    andelseier.fornavn,
    andelseier.etternavn,
    andelseier.and_eier_nr,
    leilighet.leil_nr
FROM
    andelseier
    LEFT JOIN leilighet ON andelseier.and_eier_nr = leilighet.and_eier_nr;

--Oppgave 12,
SELECT DISTINCT
    borettslag.bolag_navn
FROM
    borettslag
    JOIN bygning ON borettslag.bolag_navn = bygning.bolag_navn
    JOIN leilighet ON bygning.bygn_id = leilighet.bygn_id
WHERE
    leilighet.ant_rom = 4;

--Oppgave 13,
SELECT
    p.postnr,
    p.poststed,
    COUNT(*) "Antall andelseiere"
FROM
    leilighet l,
    bygning b,
    poststed p
WHERE
    l.bygn_id = b.bygn_id
    AND b.postnr = p.postnr
GROUP BY
    p.postnr,
    p.poststed;