#!/bin/bash

FILE=$(dirname "$0")/postman-test/config/config.txt

if [ -f $FILE ]; then
	
	. $FILE
else
	echo "Error: Configuration file does not exist"

fi


