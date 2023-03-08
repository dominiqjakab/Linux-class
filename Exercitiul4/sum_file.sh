#!/bin/bash

sum=0

while read -r x
	do  ((sum +=  x))
done < numbers.txt
echo $sum
