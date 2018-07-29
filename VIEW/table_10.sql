CREATE VIEW `table_10` AS
SELECT 
	customer.id_customer AS 'ID',
	customer.cu_name AS 'Ім`я',
	customer.cu_surname AS 'Прізвище',
	customer.cu_telephone AS 'Телефон',
	customer.cu_city AS 'Місто',
	customer.cu_address AS 'Адреса',
	situation_social.situation_social AS 'Соціальне становище'
FROM
	customer, situation_social
WHERE
	situation_social.id_situation = customer.situation_social_id_situation
	and customer.cu_city = 'Київ';

#вивести замовників з Києва