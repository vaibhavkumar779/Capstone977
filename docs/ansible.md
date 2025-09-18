# Ansible Automation

This document explains how Ansible is used for configuration management.

## Purpose

- Automate Jenkins server installation and configuration.
- Modular roles for adding keys, repositories, and installing Jenkins.

## Usage

- Inventory defined in `ansible/inventory.ini`.
- Main playbook: `ansible/jenkinsDeploy.yml`.
- Roles: `ansible/jenkins/` (tasks, handlers, vars).

## Example Command

```sh
ansible-playbook -i ansible/inventory.ini ansible/jenkinsDeploy.yml
```
