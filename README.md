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

## Clone this repo to your Control Server
```
git clone https://github.com/devops-donm/zero_ansible_server.git
```

## Ansible Configuration File (ansible.cfg)
- Verify remote_user

## Set Up the Inventory File
inventory/servers config format.

1. Add your individual servers.
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
ansible -i inventory/hosts all -m ping -k
```

## Troubleshooting
- Validate variables in ansible.cfg
- Verify data / format in inventory/hosts file

# Usage
## Hardening Playbook:
You may be required to input both the user's password and the sudoers password.

`ansible-playbook playbooks/srv_harden.yml -k -K`

After running the hardening paybook you will only be asked for the sudoers password.

`ansible-playbook playbooks/srv_harden.yml --ask-become-pass`

### Actions on node
- Update / Upgrade packages
- Configure and enable UFW firewall (SSH, HTTP, HTTPS)
- Locks down SSH config and sets public key authentication
- Install and configure Docker (latest stable)
- Installs Docker-Compose (v2.29.7)
- Reboots the server if required

## Nginx Container Playbook:

`ansible-playbook playbooks/nginx_container.yml`

### Actions on node
- Verifies /opt/nginx/configs and /opt/nginx/certs directories are created
- Clones the latest version of the [NGINX Container Repo](https://github.com/devops-donm/nginx_container)
- Stop existing Docker containers
- Build and start new Docker containers
- Restart Docker

> [!NOTE]
> /opt/nginx/configs and certs are used for persistant storage to prevent data loss during container deployments.
