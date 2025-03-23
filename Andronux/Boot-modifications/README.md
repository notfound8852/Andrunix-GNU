1. Get your device's firmware from there official website. DO NOT TRUST OTHER RANDOM WEBSITES MAKE SURE YOU HAVE THE CORRECT FIRMWARE CAUSE IF YOU DON'T AND FLASH THE WRONG boot.img YOUR DEVICE ***WILL*** BOOT-LOOP.

2. Go to your linux machine/VM/wsl and open the terminal

3. Run.
```bash
sudo apt update && sudo apt upgrade -y
sudo apt install abootimg mkbootimg cpio gzip wget -y
```

4. Switch to root user and to make this as clean as possible we make some folder.
```bash
mkdir android && cd android
```

5. Now put your boot.img into this directory we just created.

6. Run the following..
```bash
abootimg -x boot.img && \
mkdir ramdisk && \
cd ramdisk && \
gzip -dc ../initrd.img | cpio -idmv
```

7. Run the following: 
```bash
mkdir xbin
cd xbin
curl busybox-url --output busybox
```
Here is a **[link](https://busybox.net/downloads/binaries/1.31.0-defconfig-multiarch-musl/)** to busybox's binaries get the one that works for your device. (**Refer to examples.md if u are confused about which busybox to get [here](https://github.com/notfound8852/Andronux-GNU/blob/main/Andronux/Boot-modifications/examples.md).)**

8. If you have a rootless setup: **[Rootless setup](https://github.com/notfound8852/Andronux-GNU/blob/main/Andronux/Boot-modifications/Rootless.md)**. Come back here after you do the additional stuff. If not, follow along with this current setup.

9. Run the following: 
```sh
nano setup_linux.sh # paste your script, save and exit
chmod +x setup_sshd.sh
```
**[setup_sshd.sh](https://github.com/notfound8852/Andronux-GNU/blob/main/Andronux/scripts/setup_sshd.sh)**

10. Edit your init.rc. (I used nano ) go to the first section under on early-init and add the following:
```sh
export PATH /usr/sbin:/usr/bin:/sbin:/system/sbin:/system/bin:/system/xbin:/vendor/bin:/vendor/xbin
```

11. After post-fs-data and at the very end of that section before the services and  `restorecon --recursive --skip-ce /data` or something similar add this, then save and exit (make sure the spacing is correct):
```bash
    mount rootfs rootfs / rw remount
    exec u:r:init:s0 -- /xbin/busybox mount -o remount,dev,suid /data
    mount none /data/rootfs/home /home bind
    mount none /data/rootfs/boot /boot bind
    mount none /data/rootfs/media /media bind
    mount none /data/rootfs/opt /opt bind
    mount none /data/rootfs/run /run bind
    mount none /data/rootfs/srv /srv bind
    mount none /data/rootfs/tmp /tmp bind
    mount none /data/rootfs/var /var bind
    mount none /data/rootfs/usr /usr bind
    mount none /data/rootfs/etc /system/etc bind
    mount none /data/rootfs/root /root bind
    exec u:r:init:s0 -- /xbin/setup_sshd.sh
```
if you are unsure where to place the above, refer to [this](https://github.com/notfound8852/Andronux-GNU/blob/main/Andronux/Boot-modifications/examples.md)

12. Make the ramdisk similar to that of Linux.
```bash
mkdir boot home media opt run srv tmp usr var boot root sbin
chmod 1777 ./tmp
# if you are on amd64 or some system that usually has a lib64 folder, run the following:
# mkdir usr/lib64
# ln -s usr/lib64 ./lib64
```

13. Fix android's garbage hardcoded system:
```bash
# if sbin exists. jump into that dir and fix ueventd and watchdogd these are hardcodded on some ROMs like mine
cd sbin 
unlink ./watchdogd && \
unlink ./ueventd && \
ln -s /init ./ueventd && \
ln -s /init ./watchdogd
cd ..
```

---
---

### Making android more like linux:

14. Run the following to make /usr behave and run like a proper partition(even though it is not. This will make it work as intended just like in Linux).
```bash
# from ramdisk
mv ./sbin ./usr/ && mv ./lib ./usr/lib # assuming lib exists. if not create it in ./usr/lib
ln -s usr/lib ./lib && \
ln -s usr/bin ./bin && \
ln -s usr/sbin ./sbin
```

15. You are done! just pack up the boot.img. **MAKE SURE YOU ARE IN** ramdisk!!!
```bash
find . | cpio -o --format=newc | gzip > ../initrd.img && \
cd ..
```

16. Check your boot.img config file. 
```bash
cat bootimg.cfg
```
and accordingly pack up your image using mkbootimg.. check examples.md for a quick tutorial on what to do. [here](https://github.com/notfound8852/Andronux-GNU/blob/main/Andronux/Boot-modifications/examples.md). If u wanna disable selinux at boot include this tag in cmbline `androidboot.selinux=permissive`

17. Flash the image and you are done.

**done!**

---
---
