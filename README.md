# ansible-role-pssid-probe-provisioning-scripts
Ansible modules and other scripts needed to provision and configure pSSID probes from the GUI server.

# Components
`install-ansible.yml`
- Install the latest ansible on the GUI server. 

`install-provision-script.yml`
- Install provision.sh on the GUI server. 

`install-ansible-playbook-pssid-daemon.yml`
- Download on the GUI server ansible-playbook-pssid-daemon, ansible-role-pssid-daemon, ansible-role-pssid-VT-tools, ansible-role-perfsonar-testpoint

# Requirements
Supported Linux versions:
* Ubuntu 20 (Focal)
* Ubuntu 22 (Jammy)

It requires Ansible v2.9 at least.

# Role Variables
`defaults/main.yml`:
- `ansible_probe_provisioning_install_path` is the location for ansible-playbook-pssid-daemon provision script. 

`vars/main.yml` (should not be changed for a regular install):
- `provision_script_dir` is the location for provision.sh 

# Dev Mode
[username@its-perfsonar-bastion ansible-playbook-test-venv]$ ansible-playbook -i "198.111.226.184," test-playbook.yml --become   --become-method su   --become-user root   --ask-become-pass

