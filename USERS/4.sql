create user 'new_users_4'@'localhost' identified by '13579';
grant select(id_customer, cu_name, cu_surname, cu_telephone) on apteka_curs_bd.customer to 'new_users_3'@'localhost' identified by '56789';

#користувач з можливістю переглядати тільки вказані стовпці в таблиці