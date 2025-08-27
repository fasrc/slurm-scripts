# Slurm Scripts

Various useful slurm scripts.

### General

* open.sh: Can be used to open nodes with a specific state
* reset.sh: Can be used to IPMI reset nodes in a specific state
* suspend.sh: Can be used to update or modify jobs that meet specific criteria
* doit: Used to submit dummy jobs for populating XDMod once a month
* check-rsyncdryrun-paths.sh: Used for checking if a path exists in an
  input file provided as a command line argument. And, perform rsync
  --dry-run on that path. The input file must contain absolute paths
  with no header
* purge-checked-paths.sbatch: Used for submitting a batch job, on the
  test cluster, for checking if a path exists in an input file provided
  as a command line argument. And, delete that path using the rsync
  command. The input file must contain absolute paths with no header

### prunedb

* prunedb.sh: Removes users that haven't submitted jobs in the last 6 months
* pruneacctdb.sh: Removes accounts that have no users

### fairshare

* fairshare.sh: Set's the fairshare for the Cannon cluster.

