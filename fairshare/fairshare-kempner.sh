#!/bin/bash
# This script sets up the Kempner fairshare groups. Note that this does not set the actual values that is done in the main Cannon fairshare script.
# Instead this script creates the hierarchy for kempner as its different than our standard setup.

# Kempner PI Labs
kempner_pi_labs=$(echo alvarez_lab barak_lab bsabatini_lab jfrankle_lab konkle_lab pehlevan_lab sham_lab)

for lab in $kempner_pi_labs
do
  echo $lab
  sacctmgr -i create account name=kempner_$lab fairshare=0
  lab_users=$(getent group ${lab} | cut -d ":" -f 4)
  for user in ${lab_users//,/ }
  do
    sacctmgr -i add user name=$user account=kempner_$lab fairshare=parent maxsubmitjobs=10100
  done
done

# Kempner Other
kempner_other_labs=$(echo kempner_grads kempner_fellows kempner_hms)

for lab in $kempner_other_labs
do
  echo $lab
  sacctmgr -i create account name=$lab fairshare=0
  lab_users=$(getent group ${lab} | cut -d ":" -f 4)
  for user in ${lab_users//,/ }
  do
    sacctmgr -i add user name=$user account=$lab fairshare=100 maxsubmitjobs=10100
  done
done
