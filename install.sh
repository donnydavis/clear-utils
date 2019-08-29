#/bin/bash
WORKING_DIR=cl-openstack
TMP_DIR=/tmp/guestmount
rm -rf $WORKING_DIR $TMP_DIR
mkdir -p $WORKING_DIR
echo "Downloading Image"
curl -o $WORKING_DIR/cl-openstack.img.xz https://download.clearlinux.org/current/clear-$(curl https://download.clearlinux.org/latest)-cloudguest.img.xz
unxz $WORKING_DIR/cl-openstack.img.xz
mkdir -p $TMP_DIR
echo "Mounting Image"
sudo guestmount -a $WORKING_DIR/cl-openstack.img.xz -m /dev/sda2 $TMP_DIR
sudo cp openstack-config $TMP_DIR/usr/bin/
sudo chmod +x $TMP_DIR/usr/bin/openstack-config
sudo cp ucd-openstack.service $TMP_DIR/etc/systemd/system/ucd-openstack.service
sudo guestumount $TMP_DIR
echo "Scripts injected to image"

