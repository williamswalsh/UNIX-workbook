#!/bin/bash

isWon=0
while test $isWon -eq 0
do
  read -p "Please enter your guess: "  guess

  echo $guess
  if test $guess -lt 13
  then
    echo "$guess is too low."
  elif test $guess -gt 13
  then
    echo "$guess is too big."
  else
    echo "The numbers you typed sum to the correct answer -> $guess. Well done!"
    isWon=1
  fi
done