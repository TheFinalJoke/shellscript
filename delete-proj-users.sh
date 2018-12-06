#!/bin/bash
seqarg=$(( $2-1 ))
for var in `seq -w 00 $seqarg`
do
sudo userdel -r $1$var
done
sudo rm -rf /home/projects/$1
sudo rm -rf $1.project_accounts
