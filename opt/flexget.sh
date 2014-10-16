#!/system/bin/sh
ls /opt >/dev/null 2>&1 || su -c /data/sdext2/opt/optware-init.sh
# You may want to add /opt/local/bin to PATH below
export PATH=/opt/sbin:/opt/bin:/bin:/system/bin:/opt/local/bin
if busybox test $(busybox id -u) = 0; then HOME=/opt/home/root; else HOME=/opt/home/user; fi
export HOME
export TMPDIR=/tmp

# flexget
flexget execute
