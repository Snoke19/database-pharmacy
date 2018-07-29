SELECT 
	medication.id_medication AS 'id_medication',
	medication.me_name AS 'me_name',
IF((SELECT delivery.d_number_of_medicines - SUM(custom.с_number)) <= 10,'Закінчується','Достатня кількість') AS 'На складі'
FROM medication JOIN custom JOIN delivery
WHERE
	medication.id_medication = delivery.medication_id_medication
		AND medication.id_medication = custom.medication_id_medication
GROUP BY custom.medication_id_medication;

#медикаменти які закінчують і яких є достатня кількість