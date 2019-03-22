#!/usr/bin/env bash

if [ $EUID != 0 ]
then
    echo "Only can run as root"
    exit 1
fi

if [ $# != 2 ]
then
    echo "Add a Domain name and ip address for domain"
    exit 1
fi

yum install ntp ntpdate sssd realmd -y

systemctl enable ntpd
ntpdate $2
systemctl start ntpd

realm join --user=Administrator $1

echo "#Adding the group admin to sudoers file"
echo "%admin ALL=(ALL:ALL) ALL" >> /etc/sudoers

exit 0



