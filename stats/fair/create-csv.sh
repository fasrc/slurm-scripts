#!/bin/bash

sed -i '/root/d' ./rawdata/sshare.txt
sed -i 's/ //g' ./rawdata/sshare.txt
cat ./rawdata/sshare.txt | sed 's/|/,/g' > ./data/sshare.csv
