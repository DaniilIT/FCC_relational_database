# Periodic Table

Get information about chemical elements from a periodic table database.

The database consists of tables:

* elements – (atomic_number, symbol, name)
* properties – (atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id)
* types – (type_id, type)


## Settings

### Log into the psql interactive terminal 

```sh
psql --username=freecodecamp --dbname=periodic_table
```

### Make capitalize the first letter of all the symbol values

```sql
UPDATE elements SET symbol=CONCAT(UPPER(LEFT(symbol, 1)), SUBSTRING(symbol, 2));
```

### Make links to the correct type

```sql
UPDATE properties
SET type_id = CASE
    WHEN type = 'nonmetal' THEN 1
    WHEN type = 'metal' THEN 2
    WHEN type = 'metalloid' THEN 3
END;
```

### Rebuild the database

```sh
psql -U postgres < periodic_table.sql
```

### Make a dump

```sh
pg_dump -cC --inserts -U freecodecamp periodic_table > periodic_table.sql
```

### Give executable permission

```sh
chmod +x element.sh
```


## Run

```sh
./element.sh 1
./element.sh H
./element.sh Hydrogen
```

### Output:

```
The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.
```


## Goal

Сourse "Relational Database" [freeCodeCamp.org](https://www.freecodecamp.org/learn/relational-database/), lesson "Build a Periodic Table Database".
