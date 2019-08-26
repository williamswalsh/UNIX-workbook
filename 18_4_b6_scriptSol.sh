#!/bin/bash

read -p "I have a number in my head. What do you think the number is?" guess

if test $guess -lt 7
then
  echo "$guess is too low."
elif test $guess -gt 7
then
  echo "$guess is too big."
else
  echo "The number you typed $guess is right"
fi
