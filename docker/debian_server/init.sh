#!/bin/sh

mkdir /var/run/sshd
echo 'root:ansible' | chpasswd
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
mkdir -p /root/.ssh