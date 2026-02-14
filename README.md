Ansible Configuration Management Project

This project demonstrates how to use Ansible to automate the configuration and management of an Ubuntu server.
It is based on the Configuration Management project from roadmap.sh and is designed for beginners who want hands-on experience with real DevOps tooling.

Project link reference:
https://roadmap.sh/projects/configuration-management

Project Overview

The goal of this project is to automate common server setup tasks using Ansible roles.
Instead of configuring a server manually, everything is defined as code and executed consistently using a single playbook.

The automation includes:

Basic system setup and package management

Secure SSH configuration

Nginx installation and configuration

Deployment of a static website

This approach follows real-world configuration management practices used in production environments.

Technologies Used

Ubuntu Linux

Ansible

Nginx

SSH

PuTTY (for Windows users)

Project Structure
ansible-setup/
├── inventory.ini
├── setup.yml
└── roles/
    ├── base/
    │   └── tasks/main.yml
    ├── ssh/
    │   └── tasks/main.yml
    ├── nginx/
    │   └── tasks/main.yml
    └── app/
        ├── tasks/main.yml
        └── files/site.tar.gz
Roles Description
Base Role

Handles basic server preparation.
It updates the system, upgrades packages, installs common utilities, and enables fail2ban for basic security.

SSH Role

Configures SSH access by ensuring the user’s public key is added to the authorized keys file.
This allows passwordless SSH access, which is required for Ansible automation.

Nginx Role

Installs and starts the Nginx web server.
Ensures the service is enabled and running after deployment.

App Role

Deploys a static HTML website.
The website is uploaded as a tar archive, extracted into the Nginx web root, and replaces the default Nginx page.

Inventory Configuration

The inventory defines the target server.

Example inventory.ini:

[web]
localhost ansible_connection=local

This setup is beginner-friendly and allows Ansible to configure the same server it is running on.

How to Run the Project

First, install Ansible on Ubuntu:

sudo apt update
sudo apt install ansible -y

Clone the repository:

git clone https://github.com/your-username/ansible-configuration-management.git
cd ansible-configuration-management

Run the full playbook:

ansible-playbook -i inventory.ini setup.yml
Running Specific Roles Using Tags

Ansible tags allow running only a specific part of the configuration.

Run only the base setup:

ansible-playbook -i inventory.ini setup.yml --tags base

Run only the Nginx role:

ansible-playbook -i inventory.ini setup.yml --tags nginx

Run only the application deployment:

ansible-playbook -i inventory.ini setup.yml --tags app
Verification

After the playbook completes successfully, open a browser and visit:

http://<server-ip>

You should see the static website deployed by Ansible instead of the default Nginx page.

Key Concepts Learned

This project helps in understanding:

Ansible inventory and playbooks

Role-based project structure

Idempotent configuration management

SSH-based automation

Service management with systemd

Real-world server provisioning workflows

Stretch Goal

The app role can be extended to deploy the website directly from a GitHub repository using the Ansible git module instead of a tar archive.

This makes deployments more dynamic and closer to real production pipelines.

Author

Created as a hands-on learning project to understand configuration management using Ansible.
