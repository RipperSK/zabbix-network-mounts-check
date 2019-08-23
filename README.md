# zabbix-network-mounts-check

This is simple UserParameter to check mount status of /etc/fstab network mount points.
Bash script compares how many network mount points are defined in /etc/fstab and how many are actually mounted in /proc/mounts.

Zabbix user needs permissions to read both /etc/fstab and /proc/mounts.
