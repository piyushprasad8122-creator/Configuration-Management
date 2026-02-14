# Ansible Configuration Management Project

This project demonstrates how to use **Ansible** to automate the configuration and management of an Ubuntu server.  
It is based on the *Configuration Management* project from roadmap.sh.

Reference:  
https://roadmap.sh/projects/configuration-management

---

## Project Overview

The goal of this project is to automate common server setup tasks using Ansible roles instead of manual configuration.

The playbook performs the following actions:
- Updates and prepares the Ubuntu server
- Configures SSH access
- Installs and enables Nginx
- Deploys a static HTML website

This project follows real-world configuration management practices used in DevOps environments.

---

## Technologies Used

- Ubuntu Linux
- Ansible
- Nginx
- SSH
- PuTTY (for Windows access)

---

## Project Structure


ansible-setup/
├── inventory.ini
├── setup.yml
└── roles/
├── base/
│ └── tasks/main.yml
├── ssh/
│ └── tasks/main.yml
├── nginx/
│ └── tasks/main.yml
└── app/
├── tasks/main.yml
└── files/site.tar.gz


---

## Roles Description

### Base Role
- Updates apt cache
- Upgrades system packages
- Installs common utilities
- Enables fail2ban for basic security

### SSH Role
- Adds the user’s public SSH key to the server
- Enables passwordless SSH access for automation

### Nginx Role
- Installs Nginx
- Enables and starts the Nginx service

### App Role
- Uploads a static website archive
- Extracts files into the Nginx web root
- Replaces the default Nginx page

---

## Inventory Configuration

Example `inventory.ini`:


[web]
localhost ansible_connection=local


This allows Ansible to configure the same Ubuntu server it is running on.

---

## How to Run the Project

Install Ansible:


sudo apt update
sudo apt install ansible -y


Clone the repository:


git clone https://github.com/your-username/ansible-configuration-management.git

cd ansible-configuration-management


Run the complete playbook:


ansible-playbook -i inventory.ini setup.yml


---

## Running Specific Roles Using Tags

Run only the base role:


ansible-playbook -i inventory.ini setup.yml --tags base


Run only the Nginx role:


ansible-playbook -i inventory.ini setup.yml --tags nginx


Run only the application deployment:


ansible-playbook -i inventory.ini setup.yml --tags app


---

## Verification

After successful execution, open a browser and visit:


http://<server-ip>


You should see the static website deployed by Ansible instead of the default Nginx page.

---

## Key Concepts Learned

- Ansible inventories and playbooks
- Role-based configuration management
- SSH-based automation
- Idempotent server configuration
- Service management using systemd

---

## Stretch Goal

The application deployment can be extended to pull the website directly from a GitHub repository using the Ansible `git` module instead of a tar archive.

---

## Author

Created as a hands-on learning project to practice configuration management using Ansible.
