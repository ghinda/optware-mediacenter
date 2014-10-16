#!/system/bin/sh
ls /opt >/dev/null 2>&1 || su -c /data/sdext2/opt/optware-init.sh
# You may want to add /opt/local/bin to PATH below
export PATH=/opt/sbin:/opt/bin:/bin:/system/bin:/opt/local/bin
if busybox test $(busybox id -u) = 0; then HOME=/opt/home/root; else HOME=/opt/home/user; fi
export HOME
export TMPDIR=/tmp

#/bin/sh

umask 022

# prevent android from killing apps
# echo 1,2,3,4,5,6 >/sys/module/lowmemorykiller/parameters/minfree

# transmission
transmission-daemon

# samba
/opt/etc/init.d/S08samba

# openssh
/opt/etc/init.d/S40sshd

# flexget
#flexget daemon start -d
/opt/flexget.sh
