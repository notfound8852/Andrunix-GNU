#!/system/bin/sh
mv /data/data/com.termux/files/home/rootfs /data/
cp -r /sbin/* /data/rootfs/sbin/
cp -r /lib/* /data/rootfs/lib/
cp -r /root/* /data/rootfs/root/
cat /system/etc/hosts /data/rootfs/etc/hosts > /data/rootfs/new_hosts
cat /system/etc/group /data/rootfs/etc/group > /data/rootfs/new_group
cat /system/etc/passwd /data/rootfs/etc/passwd > /data/rootfs/new_passwd
cp -r /system/etc/* /data/rootfs/etc/
mv /data/rootfs/new_passwd /data/rootfs/etc/passwd
mv /data/rootfs/new_group /data/rootfs/etc/group
mv /data/rootfs/new_hosts /data/rootfs/etc/hosts
