#!/usr/bin/env bash

for var in $(seq 202 223)
do
valid=`curl -s -H 'Host: butter.com' http://192.168.50.$var:33$var -m 1 | grep "This is butter.com"`
if [[ $valid != "" ]]
then
	butter="Butter.com Correct"
else 
	butter="Butter.com incorrect"
fi

netadmin=`curl -s -H 'Host: netadmin.net' http://192.168.50.$var:33$var -m 1 | grep "This is netadmin.net"`
if [[ $netadmin != "" ]]
then
	netadminworks="Netadmin.net Correct"
else 
	netadminworks="Netadmin.net incorrect"
fi


echo "192.168.50.$var $butter and $netadminworks"
done
