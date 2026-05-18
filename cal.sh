#!/bin/bash
# Purpose           - Bash script for calculator.
# Owner             - Nithin Reddy
# Modification Date - 16/05/2026
#!/bin/bash

a=10
b=3

echo "========================="
echo "     BASH CALCULATOR"
echo "========================="
echo "Num1 = $a"
echo "Num2 = $b"
echo "-------------------------"
echo "Addition       : $a + $b = $((a + b))"
echo "Subtraction    : $a - $b = $((a - b))"
echo "Multiplication : $a * $b = $((a * b))"
echo "Division       : $a / $b = $((a / b))"
echo "Modulus        : $a % $b = $((a % b))"
echo "Power          : $a ^ $b = $(echo "$a ^ $b" | bc)"
echo "========================="

