#!/bin/bash

set `date`

case $1 in
Fri) echo "Thank Goodness";;
Sat|Sun) echo "Log off and go home";;
*) echo "Get to work";;
esac

# date outputs Sun not Sunday
# Case matching has to be letter for letter Sun -> Sun
# IF statement allows some kind of approximation of day sun with Sunday



