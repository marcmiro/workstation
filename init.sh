#!/bin/bash
# Script to initialize a new workstation

# Check if Homebrew is installed, install if we don't have it or upgrade it if we do
if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/marc.miro/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "Updating homebrew..."
  brew update
fi

# Install Ansible
if test ! $(which ansible); then
  echo "Installing Ansible..."
  brew install ansible
else
  echo "Upgrading Ansible..."
  brew upgrade ansible
fi

# Launch Ansible playbook
echo "Launching playbook with check parameter..."
ansible-playbook -i hosts main.yml --ask-become-pass --check

# Launch Ansible playbook
read -r -p "Do you want to proceed without check parameter? [y/N]" -n 1
if [[ "$REPLY" =~ ^[Yy]$ ]]; then
  echo -e "\nLaunching playbook without check parameter..."
  ansible-playbook -i hosts main.yml --ask-become-pass
fi
