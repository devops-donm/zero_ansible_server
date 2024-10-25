## Install Ansible on Ubuntu 22.04 server
```
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible -y
```

## Initial Assumptions / Requirements
1. The target server is running ubuntu 22.04 LTS
2. The target server has a user01 in the sudoers group
3. The ansible server ssh keys are located in /home/user01/.ssh
    
```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"  
# No passphrase
# default location
```
4. ./ansible.cfg - verify the name and path to the private key
5. make sure the permissions for the private key are set to 400
6. ./inventories/servers - update the server's ip address and username

inventory/servers config format.
```
["server1"]
server1 ansible_host=192.168.179.128 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/testing.pem
```

# Usage
## Initial run with password:

This option is typically for virtual machines or servers that are provided with a password.

`ansible-playbook -i inventories/servers playbooks/srv_harden.yml --ask-pass --ask-become-pass`

This will prompt for the SSH password and sudo password. After the first run, key-based authentication will be set up.

## Initial run with private key:

AWS.

`ansible-playbook -i inventories/servers playbooks/srv_harden.yml`


### Actions on target
- Update / Upgrade packages
- Configure and enable UFW firewall (SSH, HTTP, HTTPS)
- Locks down SSH config and sets public key authentication
- Install and configure Docker (latest stable)
- Installs Docker-Compose (v2.29.7)
- Reboots the server if required