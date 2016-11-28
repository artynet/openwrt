#!/bin/bash

# find package/linino/node-*/Makefile -type f -exec sed -i 's/0.10.36/0.10.37/g' {} \;

if [ -z $1 ]
then
	echo "error"
	exit 0
fi

find package/linino/node-*/Makefile -type f -exec sed -i "s/$1/$2/g" {} \;