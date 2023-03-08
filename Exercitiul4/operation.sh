#!/bin/bash

op=$1
a=$2
b=$3

if [ "$op" = "+" ]
then
	echo $op $(( $a + $b))

elif [ "$op" = "-" ]
then
	echo $op $(( $a - $b))

elif [ "$op" == "*" ]
then
	echo "$op" `expr $a \* $b`
else
   	echo "Verifica input"

fi



