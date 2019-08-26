#!/bin/bash

read -p "Please enter your first number: "  guessA
read -p "Please enter your second number: " guessB

guess=$(( $guessA + $guessB ))
echo $guess
if test $guess -lt 13
then
  echo "$guess is too low."
elif test $guess -gt 13
then
  echo "$guess is too big."
else
  echo "The numbers you typed sum to the correct answer -> $guess. Well done!"
fi
