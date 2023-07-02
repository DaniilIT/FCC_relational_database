# Celestial Bodies

Это dump (команды для восстановления базы данных) PostgreSQL с таблицами о космосе:

* galaxy
* star
* planet
* moon
* asteroid


### Команды

Сделать dump:

```sh
pg_dump -cC --inserts -U freecodecamp universe > universe.sql
```

Восстановить базу данных:

```sh
psql -U postgres < universe.sql
```

Войти в PostgreSQL:

```sh
psql --username=freecodecamp --dbname=universe
```


## Цель

Курс "Relational Database" [freeCodeCamp.org](https://www.freecodecamp.org/learn/relational-database/), урок "Celestial Bodies Database".
