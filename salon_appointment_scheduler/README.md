# Salon Appointment Scheduler

Это скрипт для записи в салон.\
Клиент выбирает услугу, затем, если его телефона нет в базе данных, то пишет свое имя, и выбирает время посещения салона.

База данных состоит из таблиц:

* services – (name,)
* customers – (name, phone)
* appointments – (customer_id, service_id, time)


### Log into the psql interactive terminal 

```sh
psql --username=freecodecamp --dbname=postgres
```

### Create the database

```sh
psql -U postgres < salon.sql
```

### Dump

```sh
pg_dump -cC --insert --username=freecodecamp salon > salon.sql
```

### Give executable permission

```sh
chmod +x insert_data.sh
```

### Run

```sh
./insert_data.sh
```


## Цель

Курс "Relational Database" [freeCodeCamp.org](https://www.freecodecamp.org/learn/relational-database/), урок "Build a Salon Appointment Scheduler".
