SELECT 
	CONCAT(employee.e_surname,' ',employee.e_name,' ',employee.e_middle_name) AS 'Прізвище, ім`я',
	employee.e_position AS 'Посадa',
	COUNT(custom.employee_id_employee) AS 'Кількість',
	NULL AS `NULL`
FROM employee JOIN custom
WHERE employee.id_employee = custom.employee_id_employee
GROUP BY custom.employee_id_employee

UNION ALL SELECT 
	NULL AS `NULL`,
	NULL AS `My_exp_NULL`,
	NULL AS `My_exp_1_NULL`,
	NULL AS `My_exp_2_NULL`
    
UNION ALL SELECT 
	'ID замовлення' AS `ID замовлення`,
	'Дата купівлі' AS `Дата купівлі`,
	'Прізвище, ім`я та побатькові' AS `Прізвище, ім``я та побатькові`,
	'Посада' AS `Посада`
    
UNION ALL SELECT 
	custom.id_custom AS 'ID замовлення',
	custom.с_date_of_purchase AS 'Дата купівлі',
	CONCAT(employee.e_surname,' ',employee.e_name,' ',employee.e_middle_name) AS 'Прізвище, ім``я та побатьковві',
	employee.e_position AS 'Посада'
FROM custom JOIN employee
WHERE custom.employee_id_employee = employee.id_employee;

#Вивести дати замовлень і продавців які оформили замовлення