-- создаем пользователя
CREATE USER railsblogsample WITH PASSWORD '123456';

-- даем разрешение на создание баз данных
ALTER USER railsblogsample CREATEDB;
