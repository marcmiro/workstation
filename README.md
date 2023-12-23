# Workstation

My workstation automatic setup.

## Requirements

To use it, you need to have installed previously:

- Ansible and its dependencies.

MacOS:
```
sudo dnf install ansible
```  

Fedora:
```
sudo dnf install ansible
``` 

## Usage

Launch the following command on the repository path.

```
ansible-playbook -i hosts main.yml --ask-become-pass
```

## Contains

This repository ensures the following configuration and software installed.

1. Common
    1. Sudo without password.
2. Fedora
    1. Install RPM.
    2. Upgrade and update system.
