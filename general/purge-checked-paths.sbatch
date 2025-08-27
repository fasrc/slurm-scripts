#!/bin/bash

# Batch script, for the test cluster, to check the paths using the
# test command and, if they exist, delete the corresponding directory
# using the rsync command. The paths are listed in a file that is
# being passed as a command line argument to this script.

#SBATCH -c 1
#SBATCH -p rc-testing # This is on the test cluster.
#SBATCH -t 7-00:00:00
#SBATCH --mem=450G
#SBATCH -o purge-lab.out
#SBATCH -e purge-lab.err
#SBATCH --no-requeue

if [ $# -lt 1 ]
then
    echo "This script requires the name of the file, whose paths need to be checked, to be passed as its 1st command line argument"
    exit
fi

while IFS= read -r line; do
    if test -e ${line}; then
        echo "${line} exists"
        rsync -rx --delete /n/netscratch/rc_admin/fscull/blank/ ${line}/
	rm -rf ${line}/
    else
        echo "${line} does not exist"
    fi
done < $1
