# Troubleshooting Guide

## Permission denied (publickey)
Cause:
- Public key not added to `authorized_keys`
- Incorrect file permissions

Fix:
```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
