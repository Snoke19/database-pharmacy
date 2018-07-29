CREATE VIEW `table_8` AS
SELECT 
	CONCAT(customer.cu_name,' ',customer.cu_surname) AS 'ім``я, прізвище'
FROM customer JOIN custom
WHERE 
	customer.id_customer = custom.customer_id_customer
		AND custom.с_date_of_purchase <= '2015-05-03';

#вивести замовників які зробили замовлення до 2015-05-03