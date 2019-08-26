#!/bin/bash

read -p "Please enter your file: "  fileName

if test -f $fileName
then
  echo "File exists: $fileName"
else
  echo -e "That file -> $fileName doesn't exist. Here are your files:\n`ls -l | awk '{print \$9}'`"
fi