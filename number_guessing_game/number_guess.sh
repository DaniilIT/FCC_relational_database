#!/bin/bash

PSQL="psql -U freecodecamp -d number_guess -t -A -c"

TAKE_NAME() {
  if [[ ! $1 ]]; then
    echo Enter your username:
  else
    echo Your username must be no more than 22 characters long. Try again:
  fi

  read USERNAME

  # LEN_USERNAME=$(echo -n $USERNAME | wc -m)
  LEN_USERNAME=${#USERNAME}
}

TAKE_NAME
until [[ "$USERNAME" && LEN_USERNAME -le 22 ]]; do
  TAKE_NAME again
done

# get user
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
if [[ -z $USER_ID ]]; then
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  USER_GAMES=$($PSQL "
    SELECT COUNT(game_id), MIN(number_of_guesses)
    FROM users LEFT JOIN games USING(user_id)
    WHERE user_id=$USER_ID
  ")

  # decomposition
  # IFS="|" read GAMES_PLAYED BEST_GAME <<< "$USER_GAMES"

  if [[ "$USER_GAMES" == "0|" ]]; then
    echo "Welcome back, $USERNAME! You haven't played games yet."
  else
    USER_GAMES_FORMATED=$( echo $USER_GAMES | sed -r 's/(.+)\|(.+)/You have played \1 games, and your best game took \2 guesses./' )
    echo "Welcome back, $USERNAME! $USER_GAMES_FORMATED"
  fi
fi

# game start
SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))
NUMBER_OF_GUESSES=0

TAKE_NUMBER() {
  if [[ $1 ]]; then
    echo "$1"
  fi

  read USER_NUMBER

  (( NUMBER_OF_GUESSES += 1 ))
}

TAKE_NUMBER "Guess the secret number between 1 and 1000:"
until [[ $USER_NUMBER -eq $SECRET_NUMBER ]]; do
  if [[ ! $USER_NUMBER =~ ^[0-9]+$ ]]; then
    TAKE_NUMBER "That is not an integer, guess again:"
    (( NUMBER_OF_GUESSES -= 1 ))
  # elif [[ ! ($USER_NUMBER -ge 1 && $USER_NUMBER -le 1000) ]]
  # then
  #   TAKE_NUMBER "That is not between 1 and 1000, guess again:"
  #   (( NUMBER_OF_GUESSES -= 1 ))
  else
    if [[ $USER_NUMBER -lt  $SECRET_NUMBER ]]; then 
      TAKE_NUMBER "It's higher than that, guess again:"
    else
      TAKE_NUMBER "It's lower than that, guess again:" 
    fi
  fi
done

echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

INSERT_GAME_RESULT=$($PSQL "
  INSERT INTO games(user_id, secret_number, number_of_guesses)
  VALUES($USER_ID, $SECRET_NUMBER, $NUMBER_OF_GUESSES)
")
