## Init.rc modification:

Sample of my init.rc:
```
    init_user0

    # Here is where to place `exec u:r:init:s0 -- /xbin/setup_linux`
    
    # Set SELinux security contexts on upgrade or policy update.
    restorecon --recursive --skip-ce /data

    # Check any timezone data in /data is newer than the copy in /system, delete if not.
    exec - system system -- /system/bin/tzdatacheck /system/usr/share/zoneinfo /data/misc/zoneinfo

    # If there is no post-fs-data action in the init.<device>.rc file, you
    # must uncomment this line, otherwise encrypted filesystems
    # won't work.
    # Set indication (checked by vold) that we have finished this action
    #setprop vold.post_fs_data_done 1

# It is recommended to put unnecessary data/ initialization from post-fs-data
# to start-zygote in device's init.rc to unblock zygote start.
```
Right after init_user0. Most likely it is different for you just place it before `restorecon` and you should be fine

### Which busybox?

base link: https://busybox.net/downloads/binaries/1.31.0-defconfig-multiarch-musl/
If you are on arm64 and or armhf(32bit equivalent). I suggest getting armv8l binary.
As for 64bit/32bit CISC CPUs. get either x86_64 or i386 if you are on amd64(somehow 💀).
As for 32bit CISC. i686 is the one..


## Quick guide on Packaging boot.img:

cat the bootcfg.img it should give you something like this:
```sh
bootsize = 0x2220000
pagesize = 0x800
kerneladdr = 0x80008000
ramdiskaddr = 0x81000000
secondaddr = 0x0
tagsaddr = 0x80000100
name = 
cmdline = ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 earlyprintk build_version=3 buildvariant=user
```

Keep in mind pagesize will have to be written in decimal and not hex. So do a convertion. For me it's `0x800` (should be the same for you. Most device have this as the default page size). 

This turns out to be **2048**.
As for the rest:
kernel_offset=kerneladdr−base
0x80008000−0x80000000=0x00008000
ramdisk_offset=ramdiskaddr−base 0x81000000−0x80000000=0x010000000
tags_offset=tagsaddr−base
0x80000100−0x80000000=0x00000100

so packing up will look like this:
NOTE THIS WILL DISABLE SELINUX IF YOU WISH NOT TO TAKE OUT `androidboot.selinux=permissive` FROM cmdline BUT BE WARNED ONE APT UPDATE WITLL BRICK YOUR SYSTEM IF SELINUX IS ON.. AND WILL BREAK EVERYTHING..
[Explanation](https://github.com/notfound8852/Andronux-GNU/blob/main/Andronux/Some-explanations/Disabling-selinux)
```bash
mkbootimg \
  --kernel zImage \
  --ramdisk initrd.img \
  --cmdline="ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 earlyprintk build_version=3 buildvariant=user androidboot.selinux=permissive" \
  --base 0x80000000 \
  --kernel_offset 0x00008000 \
  --ramdisk_offset 0x01000000 \
  --second_offset 0x00F00000 \
  --tags_offset 0x00000100 \
  --pagesize 2048 \ # page size included right here
  --output new_boot.img
```

