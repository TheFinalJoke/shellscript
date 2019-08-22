if [ `id -u` != '0' ]
then
echo "become root"
exit 1
fi

if [ $# == 2 ]
then
echo "Need bridge"
exit 1
fi 

echo "adding $1 to firewall"

firewall-cmd --permanent --direct --passthrough ipv4 -I FORWARD -i $1 -j ACCEPT
firewall-cmd --permanent --direct --passthrough ipv4 -I FORWARD -o $1 -j ACCEPT
firewall-cmd --reload

exit 0
