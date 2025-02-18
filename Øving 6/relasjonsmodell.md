# Relasjonsmodell for databaser

type(idType*, typenavn) 

modell(idModell*, Type_idType*, modellnavn) 

ordinærstol(idOrdinærstol*, modell_idModell*, pris, ant_paa_lager) 

produkter(idBestilte_produkt*) 

bestilling(idBestilling*, ordre_ordreID*,_ordre_kunde_kundeID*, antall) 

ordre(ordreID, dato_bestilling, ant_levdato, reell_levdato, rabatt, kunde_kundeID*) 

kunde(kundeID*, navn, adresse) 

spesialstol(idSpesialStol*) 

del(del_id*, navn, farge, pris, beskrivelse, arbeidsstasjon_id*, stoff_stoff_stoff_id) 

del_has_spesialstol(del_del_id*, del_arbeidsstasjon*,del_stoff_stoff_id*, Spesialstol_idSpesialStol) 

stoff(stoff_id*, navn, farge, pris, beksrivelse) 

rull(id*,stoff_stoff_id*,lengde) 

arbeidsstasjon(idArbeidsstasjon*, arbst_navn, plassering, informasjon)

---

## Følgende oversikt viser relasjonsmodellens tabeller med tilhørende felter.  
## Felt merket med en stjerne (*) indikerer primærnøkkel eller en viktig nøkkel.

---

## Tabeller

### `type`
| **Felt**  | **Kommentar**         |
|-----------|-----------------------|
| idType*   | Primærnøkkel          |
| typenavn  | Navn på type          |

*Beskrivelse*: Lagrer ulike typer som brukes i modellen.

---

### `modell`
| **Felt**         | **Kommentar**                         |
|------------------|---------------------------------------|
| idModell*        | Primærnøkkel                          |
| Type_idType*     | Fremmednøkkel til `type.idType`       |
| modellnavn       | Navn på modell                        |

*Beskrivelse*: Representerer modellene, koblet til en type.

---

### `ordinærstol`
| **Felt**              | **Kommentar**                                  |
|-----------------------|------------------------------------------------|
| idOrdinærstol*        | Primærnøkkel                                   |
| modell_idModell*      | Fremmednøkkel til `modell.idModell`            |
| pris                  | Pris for ordinær stol                          |
| ant_paa_lager         | Antall på lager                                |

*Beskrivelse*: Registrerer ordinære stoler med pris og lagerstatus.

---

### `produkter`
| **Felt**               | **Kommentar**         |
|------------------------|-----------------------|
| idBestilte_produkt*    | Primærnøkkel          |

*Beskrivelse*: Lagrer informasjon om bestilte produkter.

---

### `bestilling`
| **Felt**                         | **Kommentar**                                         |
|----------------------------------|-------------------------------------------------------|
| idBestilling*                    | Primærnøkkel                                          |
| ordre_ordreID*                   | Fremmednøkkel til `ordre.ordreID`                     |
| _ordre_kunde_kundeID*            | Fremmednøkkel til `kunde.kundeID`                     |
| antall                           | Antall bestilte produkter                           |

*Beskrivelse*: Registrerer bestillinger med tilhørende ordre- og kundereferanser.

---

### `ordre`
| **Felt**              | **Kommentar**                            |
|-----------------------|------------------------------------------|
| ordreID               | Ordre-ID (kan være primærnøkkel)          |
| dato_bestilling       | Dato for bestilling                      |
| ant_levdato           | Forventet antall leveringsdager          |
| reell_levdato         | Faktisk leveringsdato                    |
| rabatt                | Rabattbeløp                              |
| kunde_kundeID*        | Fremmednøkkel til `kunde.kundeID`          |

*Beskrivelse*: Representerer ordrer med tilhørende datoer, rabatt og kundeinformasjon.

---

### `kunde`
| **Felt**   | **Kommentar**        |
|------------|----------------------|
| kundeID*   | Primærnøkkel         |
| navn       | Kundens navn         |
| adresse    | Kundens adresse      |

*Beskrivelse*: Lagrer kundeinformasjon.

---

### `spesialstol`
| **Felt**            | **Kommentar**         |
|---------------------|-----------------------|
| idSpesialStol*      | Primærnøkkel          |

*Beskrivelse*: Inneholder data for spesialstoler.

---

### `del`
| **Felt**                      | **Kommentar**                                         |
|-------------------------------|-------------------------------------------------------|
| del_id*                       | Primærnøkkel                                          |
| navn                          | Navn på delen                                         |
| farge                         | Farge på delen                                        |
| pris                          | Pris for delen                                        |
| beskrivelse                   | Beskrivelse av delen                                  |
| arbeidsstasjon_id*            | Fremmednøkkel til `arbeidsstasjon.idArbeidsstasjon`     |
| stoff_stoff_stoff_id          | Fremmednøkkel til `stoff.stoff_id`                     |

*Beskrivelse*: Lagrer detaljert informasjon om deler, inkludert koblinger til arbeidsstasjon og stoff.

---

### `del_has_spesialstol`
| **Felt**                      | **Kommentar**                                         |
|-------------------------------|-------------------------------------------------------|
| del_del_id*                   | Delens ID (del av primærnøkkel)                        |
| del_arbeidsstasjon*           | Fremmednøkkel til `arbeidsstasjon.idArbeidsstasjon`     |
| del_stoff_stoff_id*           | Fremmednøkkel til `stoff.stoff_id`                     |
| Spesialstol_idSpesialStol      | Fremmednøkkel til `spesialstol.idSpesialStol`           |

*Beskrivelse*: Kobler deler til spesialstoler.

---

### `stoff`
| **Felt**      | **Kommentar**         |
|---------------|-----------------------|
| stoff_id*     | Primærnøkkel          |
| navn          | Navn på stoff         |
| farge         | Stoffets farge        |
| pris          | Pris for stoffet      |
| beksrivelse   | Beskrivelse av stoffet|

*Beskrivelse*: Inneholder informasjon om ulike stofftyper.

---

### `rull`
| **Felt**              | **Kommentar**                               |
|-----------------------|---------------------------------------------|
| id*                   | Primærnøkkel                                |
| stoff_stoff_id*       | Fremmednøkkel til `stoff.stoff_id`           |
| lengde                | Lengde på rullen                            |

*Beskrivelse*: Registrerer ruller av stoff med tilhørende lengde.

---

### `arbeidsstasjon`
| **Felt**                 | **Kommentar**                      |
|--------------------------|------------------------------------|
| idArbeidsstasjon*        | Primærnøkkel                       |
| arbst_navn               | Navn på arbeidsstasjonen           |
| plassering               | Lokasjon for arbeidsstasjonen      |
| informasjon              | Ekstra informasjon                 |

*Beskrivelse*: Lagrer informasjon om arbeidsstasjoner brukt i produksjonen.
