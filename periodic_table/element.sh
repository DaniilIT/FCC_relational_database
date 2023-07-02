#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only --no-align -c"

if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
else
  # get element
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1")
  else
    ATOMIC_NUMBER=$($PSQL "SELECT ATOMIC_NUMBER FROM elements WHERE symbol='$1'")
    if [[ -z $ATOMIC_NUMBER ]]
    then
      ATOMIC_NUMBER=$($PSQL "SELECT ATOMIC_NUMBER FROM elements WHERE name='$1'")
    fi
  fi

  if [[ -z $ATOMIC_NUMBER ]]
  then
    echo I could not find that element in the database.
  else
    # get property of element
    ELEMENT=$($PSQL "
      SELECT atomic_number, name, symbol, type, atomic_mass, name, melting_point_celsius, boiling_point_celsius
      FROM elements LEFT JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id)
      WHERE atomic_number=$ATOMIC_NUMBER
    ")

    echo $ELEMENT | sed -r 's/(.+)\|(.+)\|(.+)\|(.+)\|(.+)\|(.+)\|(.+)\|(.+)/The element with atomic number \1 is \2 (\3). It'\''s a \4, with a mass of \5 amu. \6 has a melting point of \7 celsius and a boiling point of \8 celsius./'

    # decomposition of element
    # IFS="|" read ELEMENT_SYMBOL ELEMENT_NAME ATOMIC_MASS MELTING_POINT BOILING_POINT ELEMENT_TYPE <<< "$ELEMENT"
  fi
fi
