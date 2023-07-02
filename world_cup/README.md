# World Cup

Это база данных, собранная из 'games.scv' и состоящая из таблиц:

* teams – футбольные команды
* games – проведенные матчи

В файле `queries.sh` собирается статистика матчей, например:

```
Year and team name of all the champions:
2014|Germany
2018|France
```


### Log into the psql interactive terminal 

```sh
psql --username=freecodecamp --dbname=postgres
```

### Create the database

```sh
psql -U postgres < worldcup.sql
```

### Dump

```sh
pg_dump -cC --insert --username=freecodecamp worldcup > worldcup.sql
```

### Insert the data

```sh
chmod +x insert_data.sh
./insert_data.sh
```

### Query the database

```sh
chmod +x queries.sh
./queries.sh
```


## Цель

Курс "Relational Database" [freeCodeCamp.org](https://www.freecodecamp.org/learn/relational-database/), урок "Build a World Cup Database".
