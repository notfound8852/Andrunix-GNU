#!/system/bin/sh

ROOTFS="/data/rootfs"

/data/rootfs/busybox mount -o remount,dev,suid /data
DIR="proc sys dev"
for dir in $DIR; do
    mount --bind "/$dir" "$ROOTFS/$dir"
done
mount -t devpts devpts $ROOTFS/dev/pts
$ROOTFS/busybox chroot $ROOTFS /bin/su - root
