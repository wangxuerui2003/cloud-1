# cloud-1
Automated deployment of Inception.

## Install ansible
`pip3 install ansible`

## Testing playbooks with vault and become sudo password
```
@shawnteh1711 ➜ /workspaces/cloud-1 (main) $ ansible-playbook -i inventory/inventory.ini playbooks/playbook.yml -u shawn --ask-become-pass --ask-vault-pass
BECOME password: 
Vault password: 
```

## Testing with site.yml
```
@shawnteh1711 ➜ /workspaces/cloud-1 (main) $ ansible-playbook site.yml -i inventory/inventory.ini -u shawn --ask-become-pass --ask-vault-pass
BECOME password: 
Vault password: 
```

## Create local VMs with Vagrant
```bash
# Make sure you installed Vagrant on your machine
$ cd local
$ vagrant up
```

## Running
```bash
# default user is wxuerui, replace the env with your own username
export USER=<your-username>

# Inside Inception there is a .env.example, create .env.db, .env.wp and .env.pma from it

# Notice: for all local plays, user is "vagrant" and become password is "password"

# setup + deploy to cloud
$ make cloud

# setup + deploy to local (VMs created by vagrant)
$ make local

# down cloud
$ make down_cloud

# down local
$ make down_local

# Setup cloud
$ make setup_cloud

# Setup local
$ make setup_local

# Deploy cloud
$ make deploy_cloud

# Deploy local
$ make deploy_local
```

## TODO
- [x] Nginx replace hardcoded server_name and ssl cert
- [ ] More readable playbooks/roles with blocks of related tasks
