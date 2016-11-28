#!/bin/bash

#if [ -z $1 ]
#then
#	echo ""
#	echo "Insert a directory !"
#	echo ""
#	
#	exit 0
#fi
#
#cd $1

if [ -z `ls package/linino | grep node- | head -n 1` ]
then
	echo "nothing !"
	exit 0
fi 

for p in `ls package/linino/ | grep node-`
do 
	make -j4 package/linino/$p/compile V=99 && echo "" && sleep 2
	
done

if [ $? -eq 1 ]
then
	exit 0
fi 

make package/index V=99
