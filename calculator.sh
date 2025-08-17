#!/bin/bash

echo "Enter two numbers:"
read num1
if ! [[ "$num1" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
  echo "Error: '$num1' is not a valid number"
  exit 1
fi

read num2
if ! [[ "$num2" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
  echo "Error: '$num2' is not a valid number"
  exit 1
fi

echo "Choose an arithmetic operation (+, -, *, /):"
read ope

case "$ope" in
  "+")
    result=$(echo "$num1 + $num2" | bc)
    ;;
  "-")
    result=$(echo "$num1 - $num2" | bc)
    ;;
  "*")
    result=$(echo "$num1 * $num2" | bc)
    ;;
  "/")
    if [[ "$num2" == "0" || "$num2" == "0.0" ]]; then
      echo "Divide by zero error"
      exit 1
    fi
    result=$(echo "scale=2; $num1 / $num2" | bc)
    ;;
  *)
    echo "Invalid operator"
    exit 1
    ;;
esac

echo "The result: $result"

