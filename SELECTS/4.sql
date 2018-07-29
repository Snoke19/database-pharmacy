set @id_1 = 10;
SELECT 
	custom.id_custom AS 'ID замовлення',
	custom.с_date_of_purchase AS 'Дата купівлі',
	medication.me_name AS 'Медикамент',
	custom.с_number AS 'кількість медикаментів',
	price.p_price_number_1 AS 'ціна за один медикамент',
	custom.с_number * price.p_price_number_1 AS 'Загальна сума',
	CONCAT(employee.e_name,' ',employee.e_middle_name,' ',employee.e_surname) AS 'Працівник'
FROM
	custom JOIN medication JOIN price JOIN employee
WHERE
	medication.id_medication = custom.medication_id_medication
		and custom.price_id_price = price.id_price
			AND custom.employee_id_employee = employee.id_employee
				AND custom.id_custom = @id_1
GROUP BY custom.id_custom;

#сума купівлі