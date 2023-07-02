#!/bin/bash

echo -e "\n~~~~~ MY SALON ~~~~~"

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

SERVICES=$($PSQL "SELECT service_id, name FROM services")


MAKE_APPOINTMENT() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  # display services
  echo "$SERVICES" | while read SERVICES_ID BAR NAME
  do
    echo "$SERVICES_ID) $NAME"
  done

  read SERVICE_ID_SELECTED
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    MAKE_APPOINTMENT "That is not a valid service number."
  else
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    if [[ -z $SERVICE_NAME ]]
    then
      MAKE_APPOINTMENT "I could not find that service. What would you like today?"
    else
      SERVICE_NAME=$(echo $SERVICE_NAME | sed -r 's/^ *| *$//g')

      # get customer info
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE

      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      if [[ -z $CUSTOMER_ID ]]
      then
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      else
        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id='$CUSTOMER_ID'")
        CUSTOMER_NAME=$(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')
      fi

      # make appointment
      echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
      read SERVICE_TIME

      INSERT_APPOINTMENT_RESULT=$($PSQL """
         INSERT INTO appointments(customer_id, service_id, time)
         VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')
      """)
      echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
    fi
  fi
}


MAKE_APPOINTMENT "Welcome to My Salon, how can I help you?\n"
