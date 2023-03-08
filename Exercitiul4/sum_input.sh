#!/bin/bash

sum=0
while read x
do
	if [ $x != 0 ]
		then ((sum+= x))
	else exit
	fi
echo "Suma numerelor introduse pana acum este" $sum
done 
