#!/bin/bash

if [ -e scripts/versioning_linino ]
then
	
	echo ""
	echo "Writing release info..."
	echo ""
	
	scripts/versioning_linino
	
	sleep 1

	echo ""
	echo "Building tools..."
	echo ""	

	make tools/compile V=99 && make toolchain/compile V=99
	
	sleep 1

	echo ""
	echo "Building image..."
	echo ""	
	
	make V=99

else

	echo ""
	echo "Versioning file not existing ! ! ! Aborting..."
	echo ""

	exit 0

fi 
