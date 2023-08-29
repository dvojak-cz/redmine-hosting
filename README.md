# Redmine hosting

## Redmine hosting
Redmine hosting is a fun little project dedicated to the basics of IaC. The idea behind this project is to spin up a simple "hosting" service that could provide [Redmine](https://www.redmine.org/) as a SaaS service to potential customers.

Redmine hosting consists of the following components:
- `ingress` reverse proxy that provides the service to customers
- `redmine` redmine applications that are provided to customers 
- `database` central database which is used to store customer data
- `monitoring` basic monitoring of the mentioned components


### Technologies used
- `vagrant` IaC tool for defining a `laboratory` environment of virtual machines. \
--- chosen for simplicity and portability of the project
- `ansible` IaC tool for basic configuration of virtual machines (servers) \
--- chosen because I have the most experience with it
zvolen, jelikož s ním mám největší zkušenosti
- `postgresql` database, storing data for redmine instances
- `zfs` filesystem used to store the data in the database \
--- chosen for efficient work with disk storage, client isolation, possibility of backups (snapshots)
- `docker` containerization tool \
--- chosen for its popularity
- `nginx` used for reverse-proxy (ingress)
- `prometheus`
- `grafana`

### Tutorial
Tutorial **will** be available in the doc directory, or at rh.dvojak.cz.

### TODO
- use container orchestrator
- use orchestrator of VMs
- make the servers more secure
    - make `sshd` more secure
    - add encryption on the back-channel
    - add firewall configuration
    - focus on the default configurations of the tools used
- create a client to manage solution
- edit td for multiuser