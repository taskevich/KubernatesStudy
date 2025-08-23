#!/bin/bash
set -e

echo "root:${ROOT_PASSWORD}" | chpasswd
echo "task:${TASK_PASSWORD}" | chpasswd

exec /usr/sbin/sshd -D
