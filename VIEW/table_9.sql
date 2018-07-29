CREATE VIEW `table_9` AS
SELECT 
	customer.id_customer AS 'id_customer',
	CONCAT(customer.cu_name,' ',customer.cu_surname) AS 'Замовник',
	COUNT(custom.customer_id_customer) AS 'Кількість замовлень'
FROM custom JOIN customer
WHERE
	customer.id_customer = custom.customer_id_customer
GROUP BY custom.customer_id_customer;

#скільки замовник зробив замовлень