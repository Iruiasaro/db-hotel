-- ESERCIZIO N.1 JOIN -  COME SI CHIAMANO GLI OSPITI CHE HANNO FATTO PIU' DI DUE PRENOTAZIONI?

-- ESERCIZIO N.2 JOIN -  STAMPARE TUTTI GLI OSPITI PER OGNI PRENOTAZIONE
SELECT ospite_id, name, lastname, prenotazione_id
FROM `prenotazioni_has_ospiti` 
LEFT JOIN ospiti
ON prenotazioni_has_ospiti.ospite_id = ospiti.id;

-- ESERCIZIO N.3 JOIN -  STAMPARE NOME, COGNOME, PREZZO E PAGANTE PER TUTTE LE PRENOTAZIONI FATTE A MAGGIO 2018
SELECT `paganti`.`name`,`paganti`.`lastname`,`pagamenti`.`price`,`paganti`.`id`
FROM `paganti`
INNER JOIN `pagamenti`
ON `paganti`.`id` = `pagamenti`.`pagante_id`;

-- ESERCIZIO N.4 JOIN -  FAI LA SOMMA DI TUTTI I PREZZI DELLE PRENOTAZIONI PER LE STANZE DEL PRIMO PIANO
SELECT SUM(`pagamenti`.`price`) AS `total_price_first_floor`
FROM `pagamenti`
INNER JOIN `prenotazioni`
ON `pagamenti`.`prenotazione_id`=`prenotazioni`.`id`
INNER JOIN `stanze`
ON `prenotazioni`.`stanza_id`=`stanze`.`id`
WHERE `stanze`.`floor`= 1;

-- ESERCIZIO N.5 JOIN -  PRENDI I DATI DI FATTURAZIONE PER LA PRENOTAZIONE CON ID=7
SELECT `paganti`.`name`, `paganti`.`lastname`,`paganti`.`address` 
FROM `paganti`
INNER JOIN `pagamenti`
ON `pagamenti`.`pagante_id`=`paganti`.`id`
INNER JOIN `prenotazioni`
on `pagamenti`.`prenotazione_id`=`prenotazioni`.`id`
WHERE `prenotazioni`.`id`='7';

-- ESERCIZIO N.6 JOIN -  LE STANZE SONO STATE TUTTE PRENOTATE ALMENO UNA VOLTA? (VISUALIZZARE LE STANZE NON ANCORA PRENOTATE)
SELECT `stanza_id`,`stanze`.`room_number`
FROM `prenotazioni`
RIGHT JOIN `stanze`
ON `stanze`.`id` =`prenotazioni`.`stanza_id`
WHERE `prenotazioni`.`stanza_id` IS NULL;