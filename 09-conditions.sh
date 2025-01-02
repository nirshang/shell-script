#!/bin/bash
echo "Please enter a number:"
read -s NUMBER
if [ $NUMBER -gt 100 ]
then
    echo "entered number is greater than 100"
else
    echo "entered number is not greater than 100"
fi