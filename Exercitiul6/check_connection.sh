#!/bin/bash
#Check connectivity to google.com

SITE="www.google.com"
ping -c 3 $SITE > /dev/null

if [[ $? != 0 ]]
	then
		echo "The internet seems to be down."
		echo "Today is `date`"
	else
		echo "The internet is up "
fi
