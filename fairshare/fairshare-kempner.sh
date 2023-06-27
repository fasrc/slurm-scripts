#!/bin/bash
# This script sets up the Kempner fairshare groups. Note that this does not set the actual values that is done in the main Cannon fairshare script.
# Instead this script creates the hierarchy for kempner as its different than our standard setup.

kempner_pi_labs=$(echo alvarez_lab barak_lab bsabatini_lab jfrankle_lab konkle_lab pehlevan_lab)

for lab in $kempner_pi_labs
do
  echo $lab
  echo sacctmgr -i create account name=kempner_$lab fairshare=0
  lab_users=$(getent group ${lab} | cut -d ":" -f 4)
  echo $lab_users
done
