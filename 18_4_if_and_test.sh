#!/bin/bash

set `date`
if test $1=Friday
then
  echo "Thank Goodness"
elif test $1=Saturday || $1=Sunday
then
  echo "Log off and go home"
else
  echo "Get to work"
fi



# Disables history
# set +o history

# Enables history
# set -o history


if test 4 -eq 3
  then
  echo "eq"
  else
  echo "ne"
  fi

# Test command options

# is a file a directory or a file
-d file1
-f file2

# Algebraic Relations
n1 -eq -ne -gt -lt -ge -le n2
#
# String equality
s1=s2
s1!=s2