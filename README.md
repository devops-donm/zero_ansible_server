## Install Ansible on Ubuntu 22.04 server
```
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible -y
```

## Initial Assumptions
1. The server is running ubuntu 22.04 LTS
2. The server you want to manage has a user01 in the sudoers group

## Initial run with password:
`cd ansible`
`ansible-playbook -i inventories/servers playbooks/srv_harden.yml --ask-pass --ask-become-pass`

This will prompt for the SSH password and sudo password. After the first run, key-based authentication will be set up.

## Subsequent runs with key-based authentication:
`ansible-playbook -i inventories/servers playbooks/srv_harden.yml --ask-become-pass`