#!/bin/bash

## ################################################################
# Desc: This script installs Ansible in a virtual environnement 
# Autor: Mansour KA      
# Update: 01/08/23 add install for RedHat OS
#
##################################################################

# Init virtual environment variable name
venv_name=venv

# Check if the OS is Debian or Ubuntu
if [ -x "$(command -v lsb_release)" ]; then
  os_name=$(lsb_release -si)
else
  echo "Warning: lsb_release command not found.Your OS Distribution is RedHat"
fi

# 1- Update apt & Install dependance packages 
if [[ "$os_name" == "Debian" || "$os_name" == "Ubuntu" ]]; then
  sudo apt-get update 
  sudo apt install python3 python3-pip python3-venv -y
else
  sudo yum apt-get update 
  sudo yum apt install python3 python3-pip python3-venv -y
fi

# Create the virtual environment 
python3 -m venv $venv_name
# Activate the virtual environment
source $venv_name/bin/activate

# 3- Install ansible
pip install ansible
# Add ansible lint: a linting tool for Ansible playbooks
pip install "ansible-lint[yamllint]"

# If you want to install a specific Ansible version, uncomment and modify the next line:
# ansible_version=
# pip install ansible==$ansible_version

# check ansible installed version
ansible  --version

echo "Thank you for installing Ansible from my script ! MKA (°_°)"

#------------------INFO------------------------------------------------
# The USER running the script must have sudo privileges
