# SSH Key-Based Authentication Setup (EC2 Ubuntu)

This project demonstrates how to set up secure SSH key-based authentication between two Ubuntu EC2 instances on AWS.

The goal is to enable passwordless SSH access using modern SSH keys (ed25519), following Linux and cloud security best practices.

## Project Objectives
- Understand SSH public/private key authentication
- Configure passwordless SSH between EC2 instances
- Learn why `ssh-copy-id` fails on cloud servers
- Manually install SSH keys securely
- Apply correct Linux permissions for SSH

## Environment
- Cloud Provider: AWS EC2
- OS: Ubuntu Server
- SSH Key Type: ed25519
- Authentication: Key-based (no password)

## High-Level Flow
1. Generate SSH key on source EC2
2. Copy public key
3. Login to target EC2 using `.pem` key
4. Add public key to `authorized_keys`
5. Verify passwordless SSH access

## Commands Used (Summary)
```bash
ssh-keygen -t ed25519
cat ~/.ssh/id_ed25519.pub
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
ssh ubuntu@<target-ip>
