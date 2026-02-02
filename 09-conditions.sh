#!/bin/bash

number=$1

if [ $number -gt 20 ]; then
   echo "Given number: $number is greater than 20"
elif [ $number -eq 20 ]; then
    echo "Given number: $number is equal to 20"
else
    echo "Given number: $number is less than 20"
fi
