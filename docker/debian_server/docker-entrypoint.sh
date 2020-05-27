#!/bin/sh
set -e

mkdir /var/run/sshd
echo 'root:ansible' | chpasswd
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

mkdir -p /root/.ssh
cp /tmp/.ssh/id_rsa.pub /root/.ssh/authorized_keys
chmod 700 /root/.ssh
chmod 644 /root/.ssh/authorized_keys

exec /usr/sbin/sshd -D