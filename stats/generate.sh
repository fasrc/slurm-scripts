#!/bin/bash

sacct --parsable2 -X -r $1 -s CD -o JobID,User,Account,AllocCPUs,ElapsedRaw,TimelimitRaw --starttime=2022-04-01 --endtime=2022-04-30 > $1.txt
sacct --parsable2 -X -r $1 -s CD -o JobID,User,Account,AllocCPUs,ElapsedRaw,TimelimitRaw --starttime=2022-05-01 --endtime=2022-05-31 >> $1.txt
sacct --parsable2 -X -r $1 -s CD -o JobID,User,Account,AllocCPUs,ElapsedRaw,TimelimitRaw --starttime=2022-06-01 --endtime=2022-06-30 >> $1.txt
sacct --parsable2 -X -r $1 -s CD -o JobID,User,Account,AllocCPUs,ElapsedRaw,TimelimitRaw --starttime=2022-07-01 --endtime=2022-07-31 >> $1.txt
sacct --parsable2 -X -r $1 -s CD -o JobID,User,Account,AllocCPUs,ElapsedRaw,TimelimitRaw --starttime=2022-08-01 --endtime=2022-08-31 >> $1.txt
sacct --parsable2 -X -r $1 -s CD -o JobID,User,Account,AllocCPUs,ElapsedRaw,TimelimitRaw --starttime=2022-09-01 --endtime=2022-09-30 >> $1.txt
