#!/bin/bash
# Script to initialize a new workstation

# Check if Homebrew is installed, install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew recipes
brew update

# Install Ansible
if test ! $(which ansible); then
  echo "Installing Ansible..."
  brew install ansible
fi

# Launch Ansible playbook
ansible-playbook -i hosts main.yml --ask-become-pass
