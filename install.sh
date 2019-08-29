#/bin/bash
WORKING_DIR=cl-openstack
rm -rf $WORKING_DIR
mkdir -p $WORKING_DIR
curl -o $WORKING_DIR/cl-openstack.img.xz https://download.clearlinux.org/current/clear-$(curl https://download.clearlinux.org/latest)-cloudguest.img.xz
unxz WORKING_DIR/cl-openstack.img.xz
