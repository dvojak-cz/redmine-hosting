# Lab setup
At the end of this guide you should have up end running lab environment with first dummy client.

> Guide was tested using: `virtualbox-7.0`, `vagrant-2.3`, `debian-12`.

## Requirements
- [virtualbox](https://www.virtualbox.org/) (or other compatible VMM)
- [ansible](https://www.ansible.com/)
- [vagrant](https://www.vagrantup.com/)
- [docker](https://www.docker.com/)
- [terraform](https://www.terraform.io/)
- [cfssl](https://github.com/cloudflare/cfssl)

## Guide

### 0. Setting up host
In case you are using virtualbox, make sure you have enabled the creation of the necessary ip ranges

```bash
# allow full range of IPv4 for VMs
echo '* 0.0.0.0/0 ::/0' | sudo tee -a /etc/vbox/networks.conf
```
Install required ansible packages
```bash
# install ansible requirements
ansible-galaxy install -r ansible/requirements.yaml
```
Add all public SSH keys, that you want to import to VMs,  to `vagrant/.ssh_public_keys`. If you don't want to add any, leave the file empty.
```bash
# set list of public keys to import
cat ~/.ssh/id_rsa.pub >> ./vagrant/.ssh_public_keys
```

### 1. Create VMs
Use vagrant to create all VMs.
```bash
cd vagrant
# create and run VMs
VAGRANT_EXPERIMENTAL=disks vagrant up
```
If you want to add or remove any machine, feel free to customize `vagrant/Vagrantfile`

### 2. Setup VMs
Install and configure VMs. You can use provided playbooks from `ansible/playbook.yml`.
```bash
cd ansible
ansible-playbook playbook.yml -i inv
```

Since we are installing zfs kernel module, please restart `db` VM so latest kernel is used.
```
cd vagrant
vagrant ssh db -c "sudo reboot"
```

### 3. tf
```
cd tf/users
terraform init
# Check `vars/localhost.tfvars`
terraform plan -var-file=vars/localhost.tfvars
terraform apply -var-file=vars/localhost.tfvars
# save password for the users db - dmx+*_VMrpE8BT<R
```


```
cd docker/worker
sudo docker-compose -f docker-compose.nginx.yml up -d
```