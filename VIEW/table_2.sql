CREATE VIEW `table_2` AS
SELECT 
	medication.me_name as 'Медикамент',
	medication.me_pharmaco_therapeutic_group as 'Лікарська форма',
	price.p_price_number_1 as 'ціна медикамента'
FROM medication JOIN price
WHERE medication.id_medication = price.medication_id_medication
	AND price.p_price_number_1 > 100

#вивести таблетки ціна яка більша 100