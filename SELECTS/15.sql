SELECT 
	customer.id_customer AS 'ID',
	concat(cu_name,' ',cu_surname) AS 'Ім`я, прізвище',
    customer.cu_telephone AS 'Телефон',
    customer.cu_city AS 'Місто',
    customer.cu_address AS 'Адреса',
    situation_social.situation_social AS 'Соціальне становище',
    0.10 as 'Знижка'
FROM customer, situation_social
WHERE
	situation_social.id_situation = customer.situation_social_id_situation;

#замовники їхнє соціальне становище і знижка