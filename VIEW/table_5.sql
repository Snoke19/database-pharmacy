CREATE VIEW `table_5` AS
SELECT 
	employee.id_employee as 'ID',
	CONCAT(employee.e_name,' ',employee.e_middle_name,' ',employee.e_surname) as 'Ім`я, прізвище',
	employee.e_salary + 250 as 'Зарплата'
FROM employee;

#виводить працівника і його заплату (додано 250)