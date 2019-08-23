#!/usr/bin/env bash

if [ $# != 1 ]
then
echo "Have to have one arguement"
exit 1
fi

if [ -d $1 ]
then
    echo "This is a valid directory"
    cd $1
else
    echo "This is not a valid directory"
    echo "Exiting Script"
    exit 1
fi

if [ -d backup ]
then
    echo "Backup Directory exists"
else
    echo "Would you like to make a backup directory"
    read answer

    while [ $answer != "yes"  -o $answer != "y" -o $answer != "no" -o $answer != "n" ]
    do
    if [ $answer == "yes" -o $answer == "y" ]
    then
        echo "Making backup directory in Current working directory"
        mkdir -p backup
        break
     else if [ $answer == "no" -o $answer == "n" ]
     then
        echo "No back up directory was created"
        echo "exiting script"
        exit 1
     else
        echo "Invalid input try again"
        read answer
     fi
     fi
    done
fi


