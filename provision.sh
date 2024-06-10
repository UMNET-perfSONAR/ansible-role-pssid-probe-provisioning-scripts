#!/bin/bash

# Install Ansible
install_ansible() {
    echo "Installing Ansible..."
    if command -v ansible-playbook &>/dev/null; then
        echo "Ansible is already installed."
    else
        if command -v apt-get &>/dev/null; then
            sudo apt-get update
            sudo apt-get install -y ansible
        elif command -v yum &>/dev/null; then
            sudo yum install -y ansible
        else
            echo "Unsupported package manager. Please install Ansible manually."
            exit 1
        fi
    fi
}

# Download playbook
download_playbook() {
    playbook_url="https://github.com/UMNET-perfSONAR/ansible-playbook-pssid-daemon.git"
    playbook_dest="/usr/bin/ansible-playbook-pssid-daemon"
    echo "Downloading playbook from $playbook_url to $playbook_dest..."
    wget -O "$playbook_dest" "$playbook_url"
}

# Download roles
download_roles() {
    roles=(ansible-role-pssid-VT-tools ansible-role-pssid-daemon ansible-role-perfsonar-toolkit)
    for role in "${roles[@]}"; do
        echo "Downloading role $role..."
        ansible-galaxy install git+https://github.com/UMNET-perfSONAR/$role.git
    done
}

# Run playbook
run_playbook() {
    playbook_path="/usr/bin/ansible-playbook-pssid-daemon/ansible-playbook-passid-probe-provision.yml"
    echo "Running playbook $playbook_path..."
    ansible-playbook "$playbook_path"
}

# Main
install_ansible
download_playbook
download_roles
run_playbook

echo "Ansible installation, playbook download,execution and provision completed."

