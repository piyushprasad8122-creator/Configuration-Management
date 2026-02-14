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
Common Issue Explained

ssh-copy-id fails on EC2 because password authentication is disabled by default. Manual key installation is required.

Reference

Project inspired by hands-on Linux and DevOps learning practices.


---

## 3. docs/architecture.md

Explains what is happening conceptually (very good for interviews).

```markdown
# SSH Authentication Architecture

## Components
- Source EC2 Instance (client)
- Target EC2 Instance (server)
- SSH daemon (sshd)
- Public / Private key pair

## Authentication Flow
1. Client sends public key identity
2. Server checks `authorized_keys`
3. Server sends encrypted challenge
4. Client decrypts using private key
5. Access granted if validation succeeds

## Why EC2 Uses Key Authentication
- No passwords to brute-force
- Safer automation
- Required for CI/CD and cloud scaling

## Security Notes
- Private keys never leave the client
- Public keys are safe to distribute
- Permissions on `.ssh` are mandatory
