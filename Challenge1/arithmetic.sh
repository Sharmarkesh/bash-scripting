#!/bin/bash
#Basic Arithmetic Calculator
#Prompts the user for two numbers and performs +, -, *, /

# Input
read -p "Enter first number: " number1
read -p "Enter second number: " number2

sum=$((number1 + number2))
subs=$((number1 - number2))
multi=$((number1 * number2))

# If/Else - Check before dividing
if [ $number2 -gt 0 ]; then 
divi=$((number1 / number2))
echo "$number1 + $number2= $sum" "$number1 - $number2= $subs" "$number1 * $number2= $multi" "$number1 / $number2= $divi"

else 
echo "Error : Divison by zero is not allowed"

fi




