#!/bin/bash
# ============================================================
#  Author: Chu-Siang Lai / chusiang (at) drx.tw
#  Blog: http://note.drx.tw
#  Filename: setting_ssh_port.sh
#  Modified: 2016-12-05 00:53
#  Description: Quick replace ssh port for CH05 lab.
# =========================================================== 

# Get original ssh port.
SSH_PORT_ORI=$( \
    grep ansible_ssh_port hosts | \
    awk '{ print $3 }' | \
    sed 's/ansible_ssh_port=//'
  )

# Get ssh port.
SSH_PORT_NEW=$( \
    docker ps | \
    grep server1 | \
    sed -n 's/.*'0.0.0.0:'//p' | \
    sed -n 's/->.*/ /p'
  )

# Switch ssh port in inventory file.
sed "s/$SSH_PORT_ORI/$SSH_PORT_NEW/" hosts > hosts.tmp && \
  mv hosts.tmp hosts

