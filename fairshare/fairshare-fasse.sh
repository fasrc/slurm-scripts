#!/bin/bash
#This script sets the fairshare scores for labs.  Based on the 03/15/22 census with adjusted scores.

sacctmgr -i modify account set fairshare=400
sacctmgr -i modify account name=cnl set fairshare=1245
sacctmgr -i modify account name=nrg set fairshare=448

