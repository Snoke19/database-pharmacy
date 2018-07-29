set @date1 = '2015-05-01';
set @date2 = '2015-05-05';

SELECT 
	SUM(custom.с_number * price.p_price_number_1) AS `Загальна сума`
FROM
	custom JOIN price
WHERE
	custom.price_id_price = price.id_price
		AND custom.с_date_of_purchase BETWEEN @date1 AND @date2;
        
#Прибуток за одинь день або в проміжку між датами