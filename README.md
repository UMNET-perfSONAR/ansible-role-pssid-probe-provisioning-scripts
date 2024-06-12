# ansible-role-pssid-probe-provisioning-scripts
Ansible modules and other scripts needed to provision and configure pSSID probes from the GUI server.

# /tasks/install-ansible.yml
Install the latest ansible on the GUI server. 

# /tasks/install-provision-script.yml
Install provision.sh on the GUI server. 

# /tasks/download-ansible-playbook-pssid-daemon.yml
Download on the GUI server ansible-playbook-pssid-daemon, ansible-role-pssid-daemon, ansible-role-pssid-VT-tools, ansible-role-perfsonar-testpoint

# commandline ansible 

-- dev mode
[dianluhe@its-perfsonar-bastion ansible-playbook-test-venv]$ ansible-playbook -i "198.111.226.184," test-playbook.yml --become   --become-method su   --become-user root   --ask-become-pass

