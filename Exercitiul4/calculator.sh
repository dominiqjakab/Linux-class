#!/bin/bash
#Calculator
#if [ `id -u` != 0 ]; then
#  echo "Only root may run this program." ; exit 1
#fi
if [ $# != 3 ]; then   
  echo "You did not run the program correctly"
  echo "Example:  calculator 4 + 5"
  exit 1
fi
# Now do the math (note quotes)
if [ "$2" = "+" ]; then echo `expr $1 + $3`
elif [ "$2" = "-" ]; then echo `expr $1 - $3`
elif [ "$2" = "*" ]; then echo `expr $1 \* $3`
elif [ "$2" = "/" ]; then echo `expr $1 / $3`
fi
exit 0


