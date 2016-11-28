#!/bin/bash

if [ -z $1 ]
then
	echo ""
	echo "Insert a directory !"
	echo ""

	exit 0
fi 

cd $1

if [ -z `ls bin/ar71xx/packages/base | grep node- | head -n 1` ]
then
	echo "nothing !"
	exit 0
fi 

#for p in `ls package/linino/ | grep node-`

for p in `ls bin/ar71xx/packages/base | grep node- | sed s'/_.*//'`
do 
	make package/linino/$p/clean V=99 && echo "" && sleep 2
done
