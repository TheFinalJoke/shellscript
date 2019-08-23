#!/usr/bin/env bash

internet=`ping -c 1 8.8.8.8 > /dev/null`
if [[ $internet != "" ]]
then
    echo "Internet: Not Connected"
else
    echo "Internet: Connected"
    echo "IPv4 Address: `hostname -i | cut -d "e" -f 4 | cut -d " " -f 2`"
fi

/home/nickshorter/./checkifwebisup.sh

echo "OS and Kernel: `hostnamectl | grep "Operating System" | cut -d ":" -f 2`"

echo "Logged in Currently:"
who

echo "Memory Usage:"
free -h | head -2

echo "File System:"
df -h | grep mapper





