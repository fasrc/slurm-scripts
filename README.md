# Slurm Scripts

Various useful slurm scripts.

### General

* open.sh: Can be used to open nodes with a specific state
* reset.sh: Can be used to IPMI reset nodes in a specific state
* suspend.sh: Can be used to update or modify jobs that meet specific criteria
* doit: Used to submit dummy jobs for populating XDMod once a month

### prunedb

* prunedb.sh: Removes users that haven't submitted jobs in the last 6 months
* pruneacctdb.sh: Removes accounts that have no users

### fairshare

* fairshare.sh: Set's the fairshare for the Cannon cluster.

