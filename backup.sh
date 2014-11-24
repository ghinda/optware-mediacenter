#!/bin/bash

# script for backing up my config files with scp
# first argument should be the ssh ip

SERVER_IP=$1

files=(
  "/opt/start.sh"
  "/opt/flexget.sh"
  "/opt/home/root/.config/transmission-daemon/settings.json"
  "/opt/home/root/.flexget/config.yml"
  "/opt/etc/openssh/sshd_config"
  "/opt/etc/samba/smb.conf"
)

for i in "${files[@]}"
do
  :
  scp root@$SERVER_IP:$i .$i
done

