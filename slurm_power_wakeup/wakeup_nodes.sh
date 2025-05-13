#!/bin/bash
#SBATCH -J wake_up                   # job name
#SBATCH -o output/wake_up_%j.out     # standard output file
#SBATCH -e errors/wake_up_%j.err     # standard error file
#SBATCH -p rc-testing                # partition
#SBATCH -c 1                         # cpus per task
#SBATCH -t 00:20:00                  # time in HH:MM:SS
#SBATCH --mem-per-cpu=2G             # memory in GB

# get submit time 
submit_time=$(scontrol show job $SLURM_JOBID | grep SubmitTime |  awk '{print $1}' | awk -F "=" '{print $2}')

# get start time
start_time=$(scontrol show job $SLURM_JOBID | grep StartTime |  awk '{print $1}' | awk -F "=" '{print $2}')

# calculate time difference StartTime-SubmitTime
wake_up_time=$(($(date -d ${start_time} +%s) - $(date -d ${submit_time} +%s)))

# output to file
echo "$SLURM_NODELIST  $SLURM_JOBID  $submit_time  $start_time  $wake_up_time" >> time_to_wakeup.csv 
