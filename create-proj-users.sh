#!/bin/bash

yourID=`id -u`
arg1=$1
arg2=$2

#Checks if you are root
if [ $yourID != "0" ] 
then
	echo "Only root can execute"
	exit 0
fi 

#Checks if you have two arguments
if [ $# != "2" ] 
then
	echo "Must have two Arguments"
	exit 0
fi

#Checks if $1 directory exists 
if [ -d /home/projects/$arg1 ] 
then 
	echo "The directory $arg1 exists"
else 
	echo "Creating $arg1 directory"

	mkdir -p /home/projects/$arg1
	zero="00"
	for var in `seq -w 00 $(( $arg2-1 ))`
	do
	if [ $var != "00" ]
	then	
		userpass=`apg -n 1`
		useradd -d /home/projects/$arg1/$arg1$var $arg1$var
		echo $userpass | passwd $arg1$var --stdin
		chgrp -R $arg1$zero /home/projects/$arg1/$arg1$var
		chmod g+s /home/projects/$arg1/$arg1$var
		chmod 770 /home/projects/$arg1/$arg1$var

		echo $arg1$var $userpass >> ./$arg1.project_accounts
		
	else
		
		userpass=`apg -n 1`
		
		useradd -d /home/projects/$arg1/$arg1$zero $arg1$zero
		echo $userpass | passwd $arg1$zero --stdin
		chmod 700 /home/projects/$arg1/$arg1$zero 
		echo $arg1$zero $userpass >> ./$arg1.project_accounts 
	fi
		
	done 
fi 
