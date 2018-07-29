set @id_5 = 1;
SELECT 
	medication.id_medication AS 'ID медикамент',
	medication.me_name AS 'Медикамент',
	medication.me_international_name AS 'Міжнародна назва',
	medication.me_pharmaceutical_form AS 'Лікарська форма',
	medication.me_form_release AS 'Форма випуску',
	medication.me_compound AS 'Склад медикамента',
	medication.me_pharmaco_therapeutic_group AS 'Фармакотерапевтична група',
	medication.me_testimony AS 'Показання',
	medication.me_expiration_date AS 'Термін придатності',
	medication.me_dispensing AS 'Категорія відпуску',
	manufacturer.ma_name AS 'Назва виробника',
	price.p_price_number_1 AS 'Ціна',
	delivery.d_delivery_date AS 'Дата поставки',
	(SELECT delivery.d_number_of_medicines - SUM(custom.с_number) FROM custom WHERE custom.medication_id_medication = @id_5) AS 'Скільки залишилося',
	supplier.s_name AS 'Назва постачальника'
FROM medication JOIN manufacturer JOIN price JOIN delivery JOIN supplier
WHERE
	medication.id_medication = price.medication_id_medication
		AND supplier.id_provider = delivery.supplier_id_provider
			AND medication.id_medication = delivery.medication_id_medication
				AND manufacturer.id_manufacturer = medication.id_medication
					AND medication.id_medication = @id_5

#повна інформація про медикамент
