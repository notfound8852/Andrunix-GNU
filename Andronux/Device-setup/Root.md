1. Switch user to root. and create `/data/rootfs` and install a busybox binary
```sh
su
setenforce 0 # disable selinux temporarliy cause its very annoying
mount -o rw,remount / # make / rw 
mkdir /data/rootfs && cd /data/rootfs
curl busybox-url --output busybox
```
Here is a **[link](https://busybox.net/downloads/binaries/1.31.0-defconfig-multiarch-musl/)** to busybox's binaries get the one that works for your device. (**Refer to examples.md if u are confused about which busybox to get [here](https://github.com/notfound8852/Andronux-GNU/blob/main/Andronux/Boot-modifications/examples.md).)**

2. Get the rootfs.
```sh
./busybox curl https://cdimage.ubuntu.com/ubuntu-base/releases/24.10/release/ubuntu-base-24.10-base-amd64.tar.gz --output rootfs.tar.gz
```
More rootfs are available at **[this link](https://cdimage.ubuntu.com/ubuntu-base/releases/24.10/release/)

3. Extract them..
```sh
chmod +x ./busybox
./busybox tar -xz ./rootfs.tar.gz
```

4. Merge the rootfs with android.
```sh
cp -r /sbin/* /data/rootfs/sbin/ && \
cp -r /lib/* /data/rootfs/lib/ && \
cp -r /root/* /data/rootfs/root/ && \
cat /system/etc/hosts /data/rootfs/etc/hosts > ./new_hosts && \
cat /system/etc/group /data/rootfs/etc/group > ./new_group && \
cat /system/etc/passwd /data/rootfs/etc/passwd > ./new_passwd && \
mv ./new_passwd /data/rootfs/etc/passwd && \
mv ./new_group /data/rootfs/etc/group && \
mv ./new_hosts /data/rootfs/etc/hosts
```

5. Now you need to install sshd in the rootfs for that run [this](https://github.com/notfound8852/Andronux-GNU/blob/main/Andronux/scripts/setup_linux.sh) script as root and export path.
```sh
chmod +x setup_linux
./setup_linux
export PATH=/usr/sbin:/usr/bin:$PATH
```

6. Run all of the following:
```sh
echo "nameserver 8.8.8.8" > /etc/resolv.conf
groupadd -g 3003 aid_inet
groupadd -g 3004 aid_net_raw
groupadd -g 1003 aid_graphics
usermod -g 3003 -G 3003,3004 -a _apt
usermod -G 3003 -a root
groupadd storage
groupadd wheel
apt update && apt upgrade
apt install -y openssh-server openssh-client
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
echo "UsePAM no" >> /etc/ssh/sshd_config
ssh-keygen -A # incase the ssh host keys are messed up..
```

Now you are done with this setup.
