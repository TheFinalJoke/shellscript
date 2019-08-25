if [ `id -u` != 0 ] 
then 
echo "Become root"
exit 1
fi

#installing kvm
echo "Installing KVM
dnf install qemu-kvm libvirt libvirt-python libguestfs-tools virt-install -y >> /dev/null

echo "Enabling libvirtd"
systemctl enable libvirtd
echo "Starting Libvirtd"
systemctl start libvirtd
