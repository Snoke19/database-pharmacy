set @rezept = 'За рецептом';

SELECT 
	medication.id_medication,
	medication.me_name,
	medication.me_dispensing 
FROM
	medication
WHERE
	medication.me_dispensing = @rezept
ORDER BY medication.id_medication

#медикаменти які продаються за  рецептом