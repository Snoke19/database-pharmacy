CREATE VIEW `table_1` AS
SELECT 
	medication.id_medication AS 'ID',
	medication.me_name AS 'Медикамент',
	medication.me_international_name AS 'Міжнародна назва',
	medication.me_pharmaceutical_form AS 'Лікарська форма',
	medication.me_form_release AS 'Форма випуску',
	medication.me_compound AS 'Склад',
	medication.me_pharmaco_therapeutic_group AS 'Фармакотерапевтична група',
	medication.me_testimony AS 'Показання',
	medication.me_expiration_date AS 'Термін придатност',
	medication.me_dispensing AS 'Категорія відпуску',
	manufacturer.ma_name AS 'Виробник'
FROM medication, manufacturer
WHERE manufacturer.id_manufacturer = medication.manufacturer_id_manufacturer
and	medication.me_name LIKE 'А%';

#медикаменти назви яких починаються на А