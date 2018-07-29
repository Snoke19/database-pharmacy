CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_1`()
BEGIN
select 	medication.me_name
from custom join medication
where medication.id_medication = custom.medication_id_medication
and custom.с_number >= 2
group by custom.medication_id_medication;
END

#виводить медикаменти які куплялися більше 2 штук