
## On you device:

1. Install a terminal emulator like termux.

2. After installation of termux run. The following:
```sh
apt update && apt upgrade -y && apt install curl tar proot-distro -y
curl https://cdimage.ubuntu.com/ubuntu-base/releases/24.10/release/ubuntu-base-24.10-base-arm64.tar.gz --output rootfs.tar.gz
mkdir rootfs && cd rootfs
tar -xf ../rootfs.tar.gz
``` 
More rootfs [here](https://cdimage.ubuntu.com/ubuntu-base/releases/24.10/release/)

3. Proot into the rootfs and install ssh
```bash
ln -s /data/data/com.termux/files/home/rootfs /data/data/com.termux/files/usr/proot-distro/installed-rootfs/ubuntu
proot-distro login ubuntu
```

4. Everything might look very broken. or it might be fine either way. Run the following:
```bash
echo "nameserver 8.8.8.8" > /etc/resolv.conf
groupadd -g 3003 aid_inet
groupadd -g 3004 aid_net_raw
groupadd -g 1003 aid_graphics
usermod -g 3003 -G 3003,3004 -a _apt
usermod -G 3003 -a root
groupadd storage
groupadd wheel
apt update && apt upgrade -y
apt install -y openssh-server 
# if there is a random systemd issue run this:
# mv /var/lib/dpkg/info /var/lib/dpkg/info_silent
# mkdir /var/lib/dpkg/info
# apt-get update && apt -f install
# mv /var/lib/dpkg/info/* /var/lib/dpkg/info_silent
# rm -rf /var/lib/dpkg/info && mv /var/lib/dpkg/info_silent /var/lib/dpkg/info
# now reinstall ssh
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
echo "UsePAM no" >> /etc/ssh/sshd_config
ssh-keygen -A
passwd # you must do this
```

The setup is finished here..

---
---
