CREATE VIEW `table_6` AS
SELECT 
	custom.id_custom as 'ID',
	custom.с_date_of_purchase as 'Дата замовлення',
	custom.с_number as 'Кількість',
	medication.me_name as 'Назва медикамента'
FROM
	custom join medication
WHERE medication.id_medication = custom.medication_id_medication
		and custom.с_date_of_purchase BETWEEN '2015-05-01' AND '2015-05-11';

#вивести дату,кількість, назву медикамента в проміжку між датами 2015-05-01 до 2015-05-11 (10 днів)