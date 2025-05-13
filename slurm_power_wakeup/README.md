# Wake up nodes

Scripts to that submit jobs to `idle~` nodes (idle nodes that are off to save power) to wake them up.

The scripts calculate how long it takes for the nodes to wake up. Currently, it's almost all automated, except for creating `list_of_nodes.txt`, the list of `idle~` nodes that are in a good state.

## Steps:

1. Compose `list_of_nodes.txt`: list of `idle~` nodes in good state that you would like to measure how long they take to wake up.
2. Edit `wakeup_nodes.sh` to the appropriate partition and requirements (e.g., add `--gres=gpu:1` for gpu partitions).
3. Submit jobs by running `submit_jobs.sh` (e.g. `./submit_jobs.sh`) -- you may edit the `sleep` command to ~3 (but no less than that) if you have a large number of nodes.

## Header of `time_to_wakeup.csv`

```
       Node  jobID           SubmitTime            StartTime  Time diff (sec)
```
