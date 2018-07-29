SELECT 	price.p_price_number_1 AS 'Ціна за один',
		medication.me_name AS 'Медикамент'
from price JOIN medication
WHERE medication.id_medication = price.medication_id_medication
ORDER BY medication.me_name

#Вивести медикаменти і ціну медикаментів