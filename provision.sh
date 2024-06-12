#!/bin/bash

# check if two arguments are provided
# arg_1 is H/G, arg_2 is Name
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <ARG1> <ARG2>"
    exit 1
fi

ARG1=$1
ARG2=$2

# Change to the bootstrap playbook directory
cd /usr/lib/pssid/playbooks/ansible-playbook-probe-bootstrap || exit 1

# Run the bootstrap playbook
ansible-playbook \
    --inventory ../../pssid_inventory/inventory
    --become \
    --become-method su \
    --become-user root \
    --ask-become-pass \
    bootstrap.yml

# Change to the pssid daemon playbook directory
cd /usr/lib/pssid/playbooks/ansible-playbook-pssid-daemon || exit 1

# run the ansible-playbook-pssid-daemon playbook with the provided arguments
# $$ verify the path && roles
ansible-playbook \
    ansible-playbook-pssid-daemon.yml \
    --inventory ../../pssid_inventory/inventory
    --limit "$ARG1" \
    -e "name=$ARG2"