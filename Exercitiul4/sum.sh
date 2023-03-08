#!/bin/bash

echo "Introduceti un numar:"
read n

sum=0
for ((i=1;i<=$n;i++))
	do sum=$((sum + i))
done

echo "Suma numerelor de la 1 la" $n "este" $sum
