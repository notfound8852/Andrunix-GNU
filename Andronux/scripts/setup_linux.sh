#!/system/bin/sh
ROOTFS="/data/rootfs"
MOUNT_POINTS="home etc usr boot media opt run srv tmp var root sbin bin"
for dir in $MOUNT_POINTS; do
	mkdir /$dir
    mount --bind "$ROOTFS/$dir" "/$dir"
done
cp -r /lib/* /usr/lib
rm -rf /lib
ln -s /usr/lib /lib
# add anyother lib that should exist libexec does'nt matter
