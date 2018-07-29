CREATE USER 'new_users_1'@'localhost' IDENTIFIED BY '12345';
GRANT SELECT ON apteka_curs_bd.* TO 'new_users'@'localhost' IDENTIFIED BY '12345';

# клієнт з правами звичайного користувача, тільки для перегляду таблиць
# GRANT [тип привилегии] ON [название БД].[название таблицы] TO '[пользователь]'@'localhost';