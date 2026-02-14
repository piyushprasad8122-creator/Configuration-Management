#!/bin/bash

mkdir -p ~/.ssh
chmod 700 ~/.ssh

touch ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

echo "Paste your public key into ~/.ssh/authorized_keys"
