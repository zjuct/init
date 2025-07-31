#!/bin/bash

set -e

sudo chmod 777 /tmp

mkdir -p ~/.ssh
cd ~/.ssh

if [ ! -f ssh_host_rsa_key ]; then
    ssh-keygen -t rsa -b 4096 -f ssh_host_rsa_key -N ""
fi

mkdir -p /run/sshd
/usr/sbin/sshd -h ~/.ssh/ssh_host_rsa_key -p 10010

echo "ssh server started at port 10010"

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

PUB_KEY="$SCRIPT_DIR/config/id_rsa.pub"
if [ -f "$PUB_KEY" ]; then
    cat "$PUB_KEY" >> authorized_keys
else
    echo "[ERROR] $PUB_KEY not exist"
    exit 1
fi

echo "public key add to authorized_keys"

