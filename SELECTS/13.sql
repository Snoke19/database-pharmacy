set @rezept_2 = 'Таблетки';

SELECT 
	medication.id_medication,
	medication.me_name,
	medication.me_pharmaceutical_form
FROM
	medication
WHERE 
	medication.me_pharmaceutical_form = @rezept_2
ORDER BY medication.id_medication;
    
#медикаменти типу таблетки