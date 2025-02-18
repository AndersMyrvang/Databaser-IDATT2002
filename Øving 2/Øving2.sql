-- Oppgave 1
-- a) Bruk SQL til å finne fornavn og etternavn til alle forfatterne sortert alfabetisk på etternavn. 
-- Hvilken eller hvilke operasjoner fra relasjonsalgebraen brukte du?
SELECT
    fornavn,
    etternavn
FROM
    forfatter
ORDER BY
    etternavn
    -- b) Bruk SQL til å finne eventuelle forlag (forlag_id er nok) som ikke har gitt ut bøker.
    --  Hvilken eller hvilke operasjoner fra relasjonsalgebraen brukte du?
SELECT
    forlag_id
FROM
    forlag
WHERE
    forlag_id NOT IN (
        SELECT DISTINCT
            forlag_id
        FROM
            bok
    );

-- c) Bruk SQL til å finne forfattere som er født før 1900. Hvilken eller hvilke operasjoner fra relasjonsalgebraen brukte du?
SELECT
    *
FROM
    forfatter
WHERE
    fode_aar < 1900;

-- d) Bruk SQL til å finne navn og adresse til forlaget som har gitt ut boka 'Sult'. 
-- Hvilken eller hvilke operasjoner fra relasjonsalgebraen brukte du?
SELECT
    forlag_navn,
    adresse
FROM
    forlag
    JOIN bok ON forlag.forlag_id = bok.forlag_id
WHERE
    bok.tittel = 'Sult';

-- e) Bruk SQL til å finne titlene på bøkene som Hamsun har skrevet. Hvilken eller hvilke operasjoner fra relasjonsalgebraen brukte du?
SELECT
    tittel
FROM
    bok
    JOIN bok_forfatter ON bok.bok_id = bok_forfatter.bok_id
    JOIN forfatter ON bok_forfatter.forfatter_id = forfatter.forfatter_id
WHERE
    forfatter.etternavn = 'Hamsun';

-- f) Bruk SQL til å finne informasjon om bøker og forlagene som har utgitt dem. 
-- Én linje i oversikten skal inneholde bokas tittel og utgivelsesår, samt forlagets navn, adresse og telefonnummer. 
-- Forlag som ikke har gitt ut noen bøker skal også med i listen. Hvilken eller hvilke operasjoner fra relasjonsalgebraen brukte du?
SELECT
    bok.tittel,
    bok.utgitt_aar,
    forlag.forlag_navn,
    forlag.adresse,
    forlag.telefon
FROM
    bok
    LEFT JOIN forlag ON bok.forlag_id = forlag.forlag_id;

-- Oppgave 2
-- a) Skriv ut navnet på spilleren (player), teamid og mdate for hvert av målene til Germany
SELECT
    player,
    teamid,
    mdate
FROM
    goal
    JOIN game ON goal.matchid = game.id
WHERE
    (teamid = 'GER');

--b) Skriv ut antall skårede mål pr. spiller for Germany sortert synkende på antall mål
SELECT
    player,
    teamid,
    COUNT(player) AS goals_scored
FROM
    goal
WHERE
    teamid = 'GER'
GROUP BY
    player
ORDER BY
    goals_scored DESC;

--c)Skriv ut player, teamid, coach, gtime for alle målene skåret de første 10 minuttene av kampene 
-- (sjekk på attributtet gtime som sier når et mål ble scoret i en kamp)
SELECT
    player,
    teamid,
    coach,
    gtime
FROM
    goal
    JOIN game ON goal.matchid = game.id
    JOIN eteam ON game.team1 = eteam.id
WHERE
    gtime <= 10;

--d) Skriv ut datoene på kampene og navnet på laget hvor Fernando Santos var trener for team1
-- Resultattabellen skal bli slik:
-- mdate 	teamname 
-- 12 June 2012	Greece
-- 16 June 2012	Greece
SELECT DISTINCT
    game.mdate,
    eteam.teamname
FROM
    game
    JOIN eteam ON game.team1 = eteam.id
WHERE
    eteam.coach = 'Fernando Santos';

--e)Skriv ut datoene på kampene og navnet på laget hvor Fernando Santos var trener for team1 eller team2
-- Resultattabellen skal bli slik:
-- mdate 	teamname 
-- 8 June 2012	Greece
-- 12 June 2012	Greece
-- 16 June 2012	Greece
-- 22 June 2012	Greece
SELECT DISTINCT game.mdate, eteam.teamname
FROM game
JOIN eteam ON (game.team1 = eteam.id OR game.team2 = eteam.id)
WHERE eteam.coach = 'Fernando Santos';
