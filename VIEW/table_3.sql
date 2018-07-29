CREATE VIEW `table_3` AS
SELECT 
	CONCAT(customer.cu_name,' ',customer.cu_surname) AS 'Ім`я, прізвище (покупець)',
    CONCAT(employee.e_name,' ',employee.e_middle_name,' ',employee.e_surname) AS 'Ім`я, прізвище (працівник)'
FROM customer, employee, custom
WHERE 
	employee.id_employee = custom.employee_id_employee
		AND customer.id_customer = custom.customer_id_customer;
    
#покупець і працівник який продав йому товар