#!/bin/sh
set -e

cp /tmp/.ssh/id_rsa.pub /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys

exec /usr/sbin/sshd -D