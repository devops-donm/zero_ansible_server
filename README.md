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
    `ssh-keygen -t rsa -b 4096 -C "your_email@example.com"`
        - No passphrase
        - default location

# Usage
## Initial run with password:
`cd ansible`
`ansible-playbook -i inventories/servers playbooks/srv_harden.yml --ask-pass --ask-become-pass`

This will prompt for the SSH password and sudo password. After the first run, key-based authentication will be set up.

### Actions on target
- Update / Upgrade packages
- Configure and enable UFW firewall (SSH, HTTP, HTTPS)
- Locks down SSH config and sets public key authentication
- Install and configure Docker (latest stable)
- Installs Docker-Compose (v2.29.7)
- Reboots the server if required

## Subsequent runs with key-based authentication:
After the server hardening playbook has been run you will only need to run the below command.
`ansible-playbook -i inventories/servers playbooks/srv_harden.yml --ask-become-pass`