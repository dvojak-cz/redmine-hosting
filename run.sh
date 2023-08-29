#!/bin/bash

set -ex

cd vagrant
# create and run VMs
VAGRANT_EXPERIMENTAL=disks vagrant up
vagrant snapshot save up
cd ..

cd ansible
ansible-playbook playbook.yml -i inv
cd ..

cd vagrant
vagrant ssh db -c "sudo reboot"
vagrant snapshot save ansible

