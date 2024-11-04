# Ansible Control Server

## Update System Packages
```
sudo apt update && sudo apt upgrade -y
```

## Install Ansible
```
sudo apt install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt update
sudo apt install -y ansible
ansible --version
```

## Configure SSH Access to Manage Nodes

### Generate the key
```
ssh-keygen -t rsa -b 4096 -C "ansible@example.com"
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

### Copy the public key to each managed nodes
```
ssh-copy-id user@managed_node_ip
```
Replace user with your username and managed_node_ip with the IP address of the managed node.

## Clone this repo to your Control Server
```
git clone https://github.com/devops-donm/zero_ansible_server.git
```

## Set Up the Inventory File
inventory/servers config format.

1. Add your indivindual servers.
```
[server1]
server1 ansible_host=192.168.179.128
```

2. Add your individual servers to the servers group.
```
[servers]
server1
```

3. Create any additional groups as needed. Examples: OS, Region, Purpose.

## Test Connectivity to Managed Nodes
```
ansible -i inventory/hosts all -m ping
```

## Ansible COnfiguration File (ansible.cfg)
- Verify remote_user


# Usage
## Initial run with password:

This option is typically for virtual machines or servers that are provided with a password.

`ansible-playbook playbooks/srv_harden.yml --ask-become-pass`

### Actions on node
- Update / Upgrade packages
- Configure and enable UFW firewall (SSH, HTTP, HTTPS)
- Locks down SSH config and sets public key authentication
- Install and configure Docker (latest stable)
- Installs Docker-Compose (v2.29.7)
- Reboots the server if required
