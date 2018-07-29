set @id_3 = 1; # ід замовлення

SELECT 
	custom.id_custom AS 'ID замовлення',
	custom.с_date_of_purchase AS 'Дата купівлі',
	medication.me_name AS 'Медикамент',
	custom.с_number AS 'Кількість медикаментів',
	price.p_price_number_1 AS 'Ціна за один медикамент',
	custom.с_number * price.p_price_number_1 AS 'Ціна без знижки',
	custom.с_number * price.p_price_number_1 * 0.10 AS 'Знижка',
	custom.с_number * price.p_price_number_1 - custom.с_number * price.p_price_number_1 * 0.10 AS 'Загальна сума',
	CONCAT(employee.e_name,' ',employee.e_middle_name,' ',employee.e_surname) AS 'Працівник'
FROM custom JOIN medication JOIN price JOIN employee
WHERE
	custom.price_id_price = price.id_price
		AND custom.employee_id_employee = employee.id_employee
			AND custom.id_custom = @id_3
GROUP BY custom.id_custom;

#знижка