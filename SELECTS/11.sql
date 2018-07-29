set @names = 'АЛЬБА УКРАЇНА';
set @date_delivery = '2015-04-10';
set @date_delivery_1 = '2015-04-10';
SELECT 
	SUM(delivery.d_delivery_price) AS 'Сума'
FROM delivery JOIN supplier
WHERE
	supplier.id_provider = delivery.supplier_id_provider
		AND supplier.s_name = @names
			AND delivery.d_delivery_date between @date_delivery AND @date_delivery_1;

#загальна платіж постачальнику 