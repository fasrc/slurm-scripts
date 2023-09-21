#!/bin/bash

sacct --parsable2 -X -o JobID,User,Account,JobName --starttime=2023-04-01 --endtime=2023-04-30 > $1.txt
sacct --parsable2 -X -o JobID,User,Account,JobName --starttime=2023-05-01 --endtime=2023-05-31 >> $1.txt
sacct --parsable2 -X -o JobID,User,Account,JobName --starttime=2023-06-01 --endtime=2023-06-30 >> $1.txt
sacct --parsable2 -X -o JobID,User,Account,JobName --starttime=2023-07-01 --endtime=2023-07-31 >> $1.txt
sacct --parsable2 -X -o JobID,User,Account,JobName --starttime=2023-08-01 --endtime=2023-08-31 >> $1.txt
sacct --parsable2 -X -o JobID,User,Account,JobName --starttime=2023-09-01 --endtime=2023-09-21 >> $1.txt
