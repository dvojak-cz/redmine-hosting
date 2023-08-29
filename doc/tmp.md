```
cd vagrant
VAGRANT_EXPERIMENTAL=disks vagrant up
# add disk to VM
```

```
cd ansible
ansible-galaxy install -r requirements.yml
ansible-playbook playbook.yml -i inv
cd ../vagrant
vagrant ssh db -c "sudo reboot"
```

```
cd vagrant
vagrant ssh db
reboot

vagrant ssh db
su - docker
git clone https://github.com/dvojak-cz/redmine-hodting.git
```

scp -r docker docker@172.16.16.110:~/docker
scp -r docker docker@172.16.16.100:~/docker
scp -r docker docker@172.16.16.120:~/docker

```
ssh docker@172.16.16.110
cd docker/worker
sudo docker compose -f docker-compose.nginx.yml  up -d
sudo docker compose -f  docker-compose.monitoring.yml up -d
```
[nginx](172.16.16.110)

```
ssh docker@172.16.16.120
cd docker/monitor
sudo docker compose -f  docker-compose.monitoring.yml up -d

```
[prometeos](172.16.16.120:9099)
[grafana](172.16.16.120:3000)


```
ssh docker@172.16.16.100
cd docker/db
sudo docker compose -f  docker-compose.yml up -d

```