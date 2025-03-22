#!/system/bin/sh

ROOTFS="/data/rootfs"

/busybox mount -o remount,dev,suid /data
DIR="proc sys dev"
for dir in $DIR; do
	mkdir /$dir
    mount --bind "/$dir" "$ROOTFS/$dir"
done

$ROOTFS/busybox mount -t tmpfs -o size=256M tmpfs $ROOTFS/dev/shm
$ROOTFS/busybox chroot $ROOTFS /bin/su - root
