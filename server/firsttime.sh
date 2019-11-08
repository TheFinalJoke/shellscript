#!/bin/bash

if [[ `id -u` != 0 ]]
then
echo "User will have to be root"
exit 1
fi

if [[ $# != 1 ]]
then
echo "Need Hostname Arguements"
fi

hostnamectl set-hostname $1
ip=`ifconfig | grep -i -E 'inet 10' | cut -d " " -f 10`
rm /etc/sysconfig/network-scripts/ifcfg-ens192
echo -e "DEVICE=ens192\nONBOOT=yes\nTYPE=Ethernet\nBOOTPROTO=static\nIPADDR=$ip\nNETMASK=255.255.255.0\nGATEWAY=10.0.14.1" >> /etc/sysconfig/network-scripts/ifcfg-ens192

ssh pi@10.0.14.101 "sudo echo $ip $1.homelab >> /etc/pihole/lan.list"
ssh pi@10.0.14.101 "sudo pihole restartdns"
