#!/bin/bash

make distclean V=99

## get feeds?!?!?!
./scripts/feeds update -a
./scripts/feeds install -a

#sed -i \
#	-e 's#@PROJECTNAME@#'$projectname'#g'\
#	-e 's#@BRANCH@#'$target'#g' \
#	-e 's#@DATE@#'$date.$seq'#g' \
#	.config

# try to be fast here
#maxcpu="$(cat /proc/cpuinfo  |grep ^proc | wc -l)"
#if [ -z "$maxcpu" ] || [ "$maxcpu" -lt "1" ]; then
#        maxcpu=1
#fi

make deflinino

# generates /etc/linino_version file
./scripts/versioning_linino

# if build fails, rerun with -j1 to capture the
# verbose error log (V=s)
make tools/install V=99 && make toolchain/install V=99

make V=99
