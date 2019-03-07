#!/usr/bin/env bash

if [ $EUID != 0 ]
then
    echo "You will have to be root"
    exit 1
fi

if [ $# != 2 ]
then
    echo "You have to have two arguemnts"
    exit 1
fi

interface=$1
ipaddress=$2

echo -e "\nauto $interface \niface $interface inet static \n\taddress $ipaddress \n\tnetmask 255.255.255.0 \n\tgateway 192.168.0.1" >> /tmp/stuff

exit 0
