#!/bin/bash

# Script to check the paths using the test command and, if they exist,
# perform a dry run to delete the corresponding directory using the
# rsync command. The paths are listed in a file that is being passed
# as a command line argument to this script.

if [ $# -lt 1 ]
then
    echo "This script requires the name of the file, whose paths need to be checked, to be passed as its 1st command line argument"
    exit
fi

while IFS= read -r line; do
    if test -e ${line}; then
	echo "${line} exists"
	rsync -av --delete --dry-run /n/netscratch/rc_admin/fscull/blank/ ${line}
    else
	echo "${line} does not exist"
    fi
done < $1
