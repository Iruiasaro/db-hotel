-- ESERCIZIO N.1 GROUP BY - CONTA GLI OSPITI RAGGRUPPANDOLI PER ANNO DI NASCITA
SELECT COUNT(*),YEAR(`date_of_birth`)
FROM `ospiti` 
GROUP BY YEAR(`date_of_birth`);

-- ESERCIZIO N.2 GROUP BY - SOMMA I PREZZI DEI PAGAMENTI RAGGRUPPANDOLI PER STATUS
SELECT SUM(`price`), `status`
FROM `pagamenti` 
GROUP BY `status`;

-- ESERCIZIO N.3 GROUP BY - CONTA QUANTE VOLTE E' STATA PRENOTATA OGNI STANZA
SELECT COUNT(`stanza_id`),`stanza_id` AS "room_number"
FROM `prenotazioni` 
GROUP BY `stanza_id`
ORDER BY `room_number`DESC;

-- ESERCIZIO N.4 GROUP BY - FAI UNA ANALISI PER VEDERE SE CI SON OORE IN CUI LE PRENOTAZIONI SONO PIU' FREQUENTI
SELECT COUNT(`created_at`),HOUR(`created_at`)
FROM `prenotazioni` 
GROUP BY HOUR(`created_at`)
ORDER BY COUNT(`created_at`) DESC;

-- ESERCIZIO N.5 GROUP BY - QUANTE PRENOTAZIONI HA FATTO L'OSPITE CHE HA FATTO PIU' PRENOTAZIONI? (quante, non chi!)
SELECT COUNT(`ospite_id`) , `ospite_id`
FROM `prenotazioni_has_ospiti` 
GROUP BY `ospite_id`
ORDER BY COUNT(`ospite_id`) DESC
LIMIT 1;