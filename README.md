# Test Kitchen, Ansible and InSpec
This repo lets you demonstrate test driven development using Ansible and Test Kitchen

# Prerequisites
Install test kitchen, inspec, and ansible. Install the kitchen-ansible gem (`chef gem install kitchen-ansible`)

# How To
From the main directory, run `kitchen test`. It will first run a kitchen create to create the infrastructure. Then it will run a kitchen converge to apply the Ansible Playbook. Next it will run a kitchen verify to run the Chef InSpec tests. Finally, it will run a kitchen destroy to cleanup the infrastructure.

# Demonstration Script
There is a simple demonstration script stored as SCRIPT.md