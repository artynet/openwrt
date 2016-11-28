#!/bin/bash

feeds () {

    ./scripts/feeds update -a
    ./scripts/feeds install -a

}

feedsun () {

    ./scripts/feeds uninstall -a
    ./scripts/feeds clean -a

}

toolchain () {

    make tools/install V=99 && make toolchain/install V=99

}

build () {

    make V=99

}

if [ -z $1 ]
then
    echo ""
    echo "provide an argument"
    echo ""

    exit 0
else
    $1
fi
