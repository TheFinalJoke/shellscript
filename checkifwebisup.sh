#!/usr/bin/env bash

checking=`curl -s https://12.13.1.3`

if [[ $checking != "" ]]
then
    echo "`date` Web Server not working" > /home/nickshorter
    exit 1
fi

exit 0