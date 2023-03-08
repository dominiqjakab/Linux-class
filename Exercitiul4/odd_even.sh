#!/bin/bash

x=$1
if [ $(( $x%2)) == 0 ] 
then
	echo "Numarul introdus este par"
else
	echo "Numarul introdus este impar"
fi
