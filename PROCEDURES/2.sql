CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_2`(
IN date_delivary date)
BEGIN
SELECT 	medication.me_name as 'Медикамент', 
		delivery.d_delivery_date as 'Дата поставки', 
        delivery.d_number_of_medicines as 'Кількість',
        delivery.d_delivery_price as 'Ціна поставки',
        supplier.s_name as 'Постачальник'
FROM medication, delivery, supplier
WHERE medication.id_medication = delivery.medication_id_medication
and supplier.id_provider = delivery.supplier_id_provider
and delivery.d_delivery_date = date_delivary;
END

#вивести поставки за вказаною датою