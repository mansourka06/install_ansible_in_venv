#!/bin/bash
#
##########################################################################
# Descpt: This scritp install ansible in a virtual environnement 
# Auhtor: Mansour KA   
##########################################################################
      
# Begin

#set the virtual envrionnement name (put your venv name in this variable)
venv_name=venv
 
# 1- Install required packages 
sudo apt-get update 
sudo apt install python3-pip python3-venv

# 2- Create the virutal environnement 
python3 -m venv $venv_name

# 3- Activate the virtual environnement
source $venv_name/bin/activiate

# 4- Install ansible
pip install ansible

#if you want to install a specfic ansible version, uncomment the two following lines, and set your ansible version in ansible_version variable (example: ansible_version=2.7) 
#ansible_version=2.9
#pip install ansible==$ansible_version  

# 5- add ansible lint : lint tool for Ansible playbooks
pip install "ansible-lint[yamllint]"

# End

#------------------INFO------------------------------------------------
#use logged with must have sudo permission to run correctly this script
