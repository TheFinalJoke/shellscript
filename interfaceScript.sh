#!/usr/bin/env bash

#Checks if user is root
if [ $EUID != 0 ]
then
    echo "You will have to be root"
    exit 1
fi

#Checks to make sure you have two args
if [ $# != 2 ]
then
    echo "You have to have two arguments"
    exit 1
fi

#Assigning arguments
interface=$1
ipaddress=$2

#writting to the interfaces file
echo -e "\nauto $interface \niface $interface inet static \n\taddress $ipaddress \n\tnetmask 255.255.255.0 \n\tgateway 192.168.0.1" >> /tmp/stuff

#exiting script
exit 0
