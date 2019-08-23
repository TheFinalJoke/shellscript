#Created and tested vigorously by: Nicholas Shorter and Landon Hise


#fail conditions----------------------------------------------------------------
#if these are not met, script will exit

#verify user is root
  if [ "$EUID" -ne 0 ]
    then echo "Please run this script as root."
         echo "Exiting script..."
    exit 0
  fi

#script only takes one argument: current node's hostname
  if [ $# -ne 1 ]
    then echo "This script only accepts one argument: The username of the current node."
         echo "Example: \"./automate.sh workernodeX\""
         echo "- where \"X\" is the current node's assigned digit."
         echo "Exiting script..."
    exit 0
  fi

#fail conditions end------------------------------------------------------------



#install sudo
echo "----------STATUS: installing sudo package if not already present"
  sleep 3s

  apt install sudo -y


#create user master
echo "----------STATUS: creating user \"master\""
  sleep 3s

  useradd -m master
  echo "master:master" | chpasswd


#add workernodeX and master to sudoers file
echo "----------STATUS: granting user \""$1"\" and user \"master\" sudo privilege"
  sleep 3s

  echo "#PER SCRIPT: users \""$1"\" and \"main\" are granted sudo privilege" >> /etc/sudoers
  echo ""$1"	ALL=(ALL:ALL) ALL" >> /etc/sudoers
  echo "master	ALL=(ALL:ALL) ALL" >> /etc/sudoers


#export PATH variable
echo "----------STATUS: exporting PATH variable"
  sleep 3s

  echo 'export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin' >> ~/.bash_profile


#install net-tools
echo "----------STATUS: installing net-tools"
  sleep 3s

  apt install net-tools -y


#install nfs, configure folder in "/" (node version)
echo "----------STATUS: creating \"/nfsshare\" directory in \"/\" and configuring"
echo "----------STATUS: configuration type: NODE"
  sleep 3s

  apt install nfs-common -y
  mkdir /nfsshare
  chmod 777 /nfsshare
  echo '192.168.0.20:/nfsshare /nfsshare nfs defaults' >> /etc/fstab
  #     ^^^^^^^^^^^^--------> current master's IP, subject to change
  #mount -a


#update packages and install dependencies for john and rexgen
echo "----------STATUS: installing dependencies for JTR and rexgen"
  sleep 3s

  apt update -y
  apt install build-essential libssl-dev yasm libgmp-dev libpcap-dev libnss3-dev -y
  apt install libkrb5-dev pkg-config libopenmpi-dev openmpi-bin zlib1g-dev libbz2-dev -y
  apt install flex cmake bison git -y


#installation steps-------------------------------------------------------------
#rexgen install
echo "----------STATUS: installing and configuring rexgen"
  sleep 3s

  #rexgen install/configure
  cd /usr/local
  git clone https://github.com/teeshop/rexgen.git
  cd rexgen
  ./install.sh
  ldconfig

echo "----------STATUS: installing and configuring JTR"
  sleep 3s

  #JTR install/configure
  cd /usr/local
  git clone https://github.com/magnumripper/JohnTheRipper.git
  chmod 777 -R /usr/local/JohnTheRipper
  cd JohnTheRipper/src
  ./configure --enable-mpi
  make -s clean && make -sj4
  cd ../run
  #./john --test

echo "----------STATUS: end of script \"automate.sh\""
echo "To test JTR, run \"./john --test\" within \"JohnTheRipper/run\""
echo "Run \"mount -a\" on each node when ready to share load with Master"
exit 0
