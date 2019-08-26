#!/bin/bash


for name in $*
do
  finger $name
done
