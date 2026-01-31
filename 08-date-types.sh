#!/bin/bash

num1=100
num2=200
num3=pavan

sum=$(($num1 + $num2 + $num3))

echo "Sum : $sum"

#Array
FRUITS=("Mango" "Apple" "Banana" "Grapes")
echo "Fruits are: ${FRUITS[2]}"
echo "Fruits are: ${FRUITS[@]}"