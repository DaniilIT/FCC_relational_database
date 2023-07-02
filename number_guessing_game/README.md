# Number Guessing Game

Это скрипт игры, в которой компьютер загадывает число, а пользователь пытается его угадать. История игр сохраняется в базу данных PostgreSQL.

База данных состоит из таблиц:

* users – (user_id, username)
* games – (game_id, user_id, secret_number, number_of_guesses, datetime)


## Settings

### Connect to the interactive psql shell

```sh
psql --username=freecodecamp --dbname=number_guess
```

### Rebuild the database

```sh
psql -U postgres < number_guess.sql
```

### Make a dump

```sh
pg_dump -cC --inserts -U freecodecamp number_guess > number_guess.sql
```

### Give executable permission

```sh
chmod +x number_guess.sh
```


## Run

```sh
./ number_guess.sh
```

### Example of game:

```
Enter your username:
Daniil
Welcome back, Daniil! You have played 4 games, and your best game took 6 guesses.
Guess the secret number between 1 and 1000:
500
It's higher than that, guess again:
750
It's lower than that, guess again:
625
It's lower than that, guess again:
563
It's higher than that, guess again:
595
It's lower than that, guess again:
579
It's higher than that, guess again:
587
It's higher than that, guess again:
591
You guessed it in 8 tries. The secret number was 591. Nice job!
```


# Goal

Сourse "Relational Database" [freeCodeCamp.org](https://www.freecodecamp.org/learn/relational-database/), lesson "Number Guessing Game".
