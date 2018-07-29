CREATE VIEW `table_7` AS
SELECT 
	manufacturer.id_manufacturer AS 'ID',
	manufacturer.ma_name AS 'Назва',
	manufacturer.ma_country AS 'Країна',
	manufacturer.ma_address AS 'Адреса'
FROM
	manufacturer
WHERE NOT manufacturer.ma_country LIKE 'Україна'

#вивести виробників ліків не з України