#!/bin/bash

PERSON1=$1 # no space between value and =
PERSON2=$2 # $2 represents the second argument passed to the script. These are special variables in shell scripting.

echo "$PERSON1:: Hello $PERSON2, How are you?"
echo "$PERSON2:: Hi $PERSON1, I am good. How about you?"
echo "$PERSON1:: I am doing great. What are you learning $PERSON2?"
echo "$PERSON2:: I am learning Shell Scripting. what about you?"