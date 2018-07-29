SELECT 'Загальна кількість: ', count(id_medication) AS '№'
FROM medication
WHERE NOT EXISTS(SELECT * FROM custom WHERE custom.medication_id_medication = medication.id_medication)

UNION ALL SELECT
		'ID медикамента', 
		'Медикаменти'

UNION ALL SELECT 
		medication.id_medication, 
        medication.me_name
FROM medication
WHERE NOT EXISTS (SELECT * FROM custom WHERE custom.medication_id_medication = medication.id_medication);

#Вивести медикаменти які не замовлялися



