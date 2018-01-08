#!/bin/bash

if [ -f $CONFIGFILE ]; then 

	source $CONFIGFILE

else 
	echo "Error: Configuration script does not exist."
	exit $?

fi

export $PATH=$PATH:$mongoDbpath
