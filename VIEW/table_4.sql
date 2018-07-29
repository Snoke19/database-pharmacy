CREATE VIEW `table_4` AS
SELECT
	manufacturer.id_manufacturer AS 'ID',
	manufacturer.ma_name AS 'Назва',
	manufacturer.ma_country AS 'Країна',
	manufacturer.ma_address AS 'Адреса'
FROM
	manufacturer
WHERE
	manufacturer.ma_country = 'Україна';

#українські виробники