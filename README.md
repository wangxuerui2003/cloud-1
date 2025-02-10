# cloud-1
Automated deployment of Inception on a remote server.

# Install ansible
`pip3 install ansible`

# Testing simple playbook
```
@shawnteh1711 ➜ /workspaces/cloud-1 (main) $ ansible-playbook -i inventory/inventory.ini playbooks/playbook.yml --private-key ~/.ssh/id_rsa -u shawn

PLAY [Test Ansible on Cloud Server] ****************************************************************************************************************************

TASK [Gathering Facts] *****************************************************************************************************************************************
[WARNING]: Platform linux on host 128.199.145.198 is using the discovered Python interpreter at /usr/bin/python3.8, but future installation of another Python
interpreter could change the meaning of that path. See https://docs.ansible.com/ansible-core/2.18/reference_appendices/interpreter_discovery.html for more
information.
ok: [128.199.145.198]

TASK [Ping the server] *****************************************************************************************************************************************
ok: [128.199.145.198]

PLAY RECAP *****************************************************************************************************************************************************
128.199.145.198            : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

# Testing playbooks with vault and become sudo password
```
@shawnteh1711 ➜ /workspaces/cloud-1 (main) $ ansible-playbook -i inventory/inventory.ini playbooks/playbook.yml -u shawn --ask-become-pass --ask-vault-pass
BECOME password: 
Vault password: 
```

# Testing with site.yml
```
@shawnteh1711 ➜ /workspaces/cloud-1 (main) $ ansible-playbook site.yml -i inventory/inventory.ini -u shawn --ask-become-pass --ask-vault-pass
BECOME password: 
Vault password: 
```