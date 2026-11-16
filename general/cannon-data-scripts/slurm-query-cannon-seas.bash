#!/bin/bash

# This script queries the Slurm DB for a duration specified by the
# user as command line arguments
# Usage:
# sbatch slurm-query-cannon.sh startdate enddate rawdatafolder
# For example:
# sbatch slurm-query-cannon.sh 2025-02-01 2025-02-28 "<absolute-path>"

#SBATCH --partition=sapphire
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=20G
#SBATCH --time=01:30:00
#SBATCH --job-name=Slurm_Query
#SBATCH --mail-type=ALL
#SBATCH --mail-user=manasvitajoshi@g.harvard.edu

# Check if start & end dates and destination folder have been provided
STARTDATE=$1
ENDDATE=$2
DEST_DIR=$3

if [ -z "$STARTDATE" ] || [ $# -lt 3 ]; then
	echo "This script requires three command line arguments. See Usage"
	echo "sbatch slurm-query.sh <startdate> <enddate> <dest-dir>"
	echo "Date format: YYYY-MM-DD"
	exit
fi

CURRENTDATE=$STARTDATE

echo "Current = $CURRENTDATE & End = $ENDDATE"

# Destination dir for collected SLURM data
echo "Folder to store raw data is: $DEST_DIR"

while [[ "$CURRENTDATE" < "$ENDDATE" ]]; do

    stopdate=$(date -d "$CURRENTDATE + 6 day" +%Y-%m-%d)
    # Query Slurm for the duration provided as command line arguments
    sacct  --starttime=$CURRENTDATE --endtime=$stopdate -p --delimiter '____' --format=AllocCPUS,AllocNodes,AllocTRES,AveCPU,AveCPUFreq,AveDiskRead,AveDiskWrite,AvePages,AveRSS,AveVMSize,Comment,Constraints,ConsumedEnergy,ConsumedEnergyRaw,CPUTimeRAW,CPUTime,DerivedExitCode,ElapsedRaw,End,ExitCode,JobID,MaxDiskRead,MaxDiskReadNode,MaxDiskWrite,MaxDiskWriteNode,MaxPages,MaxPagesNode,MaxRSS,MaxRSSNode,MaxVMSize,MaxVMSizeNode,NCPUS,NNodes,NodeList,NTasks,Priority,Partition,ReqCPUS,ReqMem,ReqNodes,ReqTRES,Reason,Start,State,Submit,SystemCPU,Timelimit,TimelimitRaw,TotalCPU,TRESUsageInAve,TRESUsageInMax,TRESUsageInMaxNode,TRESUsageInMaxTask,TRESUsageInMin,TRESUsageInMinNode,TRESUsageInMinTask,TRESUsageInTot,TRESUsageOutAve,TRESUsageOutMax,TRESUsageOutMaxNode,TRESUsageOutMaxTask,TRESUsageOutMin,TRESUsageOutMinNode,TRESUsageOutMinTask,TRESUsageOutTot,User,UserCPU,WorkDir -D -a > ${DEST_DIR}/SlurmData_${CURRENTDATE}_${stopdate}-orig.csv

    echo "Data collected from SLURM between start date ${CURRENTDATE} and end date ${stopdate}"
    echo "SlurmData_$CURRENTDATE_$stopdate-orig.csv downloaded in ${DEST_DIR}"

    CURRENTDATE=$(date -d "$stopdate + 1 day" +%Y-%m-%d)
    echo "Now, current date is ${CURRENTDATE}"

done
