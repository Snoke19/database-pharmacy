SELECT 
	supplier.s_name AS 'Назва постачальника',
	COUNT(delivery.supplier_id_provider) AS 'Кількість поставок',
	NULL AS `NULL`,
	NULL AS `NULL`,
	NULL AS `NULL`
FROM supplier JOIN delivery
WHERE
	supplier.id_provider = delivery.supplier_id_provider
GROUP BY delivery.supplier_id_provider

UNION ALL SELECT 
	NULL ,NULL ,NULL ,NULL ,NULL
    
UNION ALL SELECT 
	'Постачальник' AS `Постачальник`,
	'Медикамент' AS `Медикамент`,
	'Дата поставки' AS `Дата поставки`,
	'Кількість медикаментів' AS `Кількість медикаментів`,
	'Ціна доставки' AS `Ціна доставки`
    
UNION ALL SELECT 
	supplier.s_name AS 'Постачальник',
	medication.me_name AS 'Медикамент',
	delivery.d_delivery_date AS 'Дата поставки',
	delivery.d_number_of_medicines AS 'Кількість медикаментів',
	delivery.d_delivery_price AS 'Ціна доставки'
FROM supplier JOIN medication JOIN delivery
WHERE
	supplier.id_provider = delivery.supplier_id_provider
		AND medication.id_medication = delivery.medication_id_medication;
        
#постачальники які поставили товар і загальна кількість