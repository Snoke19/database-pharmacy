set @id_2 = 1; # ід медикамента
SELECT 
	(SELECT delivery.d_number_of_medicines - SUM(custom.с_number) FROM custom WHERE custom.medication_id_medication = @id_2) AS 'Скільки залишилося',
    medication.me_name
FROM medication JOIN delivery JOIN custom
WHERE
	medication.id_medication = delivery.medication_id_medication
		AND medication.id_medication = custom.medication_id_medication
			AND medication.id_medication = @id_2
GROUP BY custom.medication_id_medication;

#скільки медикаментів залишилось (первірка на каса)
