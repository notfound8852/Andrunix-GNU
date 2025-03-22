#!/xbin/busybox sh

/xbin/busybox echo "android-root" > /etc/hostname
hostname android-root
/usr/sbin/sshd
