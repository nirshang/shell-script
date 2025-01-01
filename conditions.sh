#!/bin/bash
echo -s "Please enter a number:"
read number
if [ $number -gt 100 ]
then
    echo "entered number is greater number"
else
    echo "entered number is not greater number"
fi