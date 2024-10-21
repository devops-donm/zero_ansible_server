## Install Ansible on Ubuntu 22.04 server
```
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible -y
```

To use this inventory file, you can specify it when running Ansible:
`cd ansible && ansible-playbook -i inventories/servers playbooks/srv_harden.yml --ask-become-pass`