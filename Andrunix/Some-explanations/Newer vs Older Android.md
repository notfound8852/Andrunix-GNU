
As of now. I have actually experiemented with newer Androids(Just oneplus 6 so take it with a grain of salt) now and I can fully say that.. **It works.**

Previously I stated that it was challenging to do. It really isn't.
All you need to do is the following:

## For SELINUX:

1. Extract your boot.img(or where ever your Image/Kernel is stored) -> hexedit -> check where the cmdline is(it's literally at the top you can't miss it.).
It'll look like this:
```
00000000   41 4E 44 52  4F 49 44 21  0A 4A 15 01  00 80 00 00  8C 83 0F 01  ANDROID!.J..........
00000014   00 00 00 01  00 00 00 00  00 00 00 00  00 01 00 00  00 10 00 00  ....................
00000028   01 00 00 00  A1 01 00 20  00 00 00 00  00 00 00 00  00 00 00 00  ....... ............
0000003C   00 00 00 00  61 6E 64 72  6F 69 64 62  6F 6F 74 2E  63 6F 6E 66  ....androidboot.conf
00000050   69 67 66 73  3D 74 72 75  65 20 61 6E  64 72 6F 69  64 62 6F 6F  igfs=true androidboo
00000064   74 2E 68 61  72 64 77 61  72 65 3D 71  63 6F 6D 20  61 6E 64 72  t.hardware=qcom andr
00000078   6F 69 64 62  6F 6F 74 2E  75 73 62 63  6F 6E 74 72  6F 6C 6C 65  oidboot.usbcontrolle
0000008C   72 3D 61 36  30 30 30 30  30 2E 64 77  63 33 20 65  68 63 69 2D  r=a600000.dwc3 ehci-
000000A0   68 63 64 2E  70 61 72 6B  3D 33 20 66  69 72 6D 77  61 72 65 5F  hcd.park=3 firmware_
000000B4   63 6C 61 73  73 2E 70 61  74 68 3D 2F  76 65 6E 64  6F 72 2F 66  class.path=/vendor/f
000000C8   69 72 6D 77  61 72 65 5F  6D 6E 74 2F  69 6D 61 67  65 20 6C 6F  irmware_mnt/image lo
000000DC   6F 70 2E 6D  61 78 5F 70  61 72 74 3D  37 20 6C 70  6D 5F 6C 65  op.max_part=7 lpm_le
000000F0   76 65 6C 73  2E 73 6C 65  65 70 5F 64  69 73 61 62  6C 65 64 3D  vels.sleep_disabled=
00000104   31 20 6D 73  6D 5F 72 74  62 2E 66 69  6C 74 65 72  3D 30 78 32  1 msm_rtb.filter=0x2
00000118   33 37 20 73  65 72 76 69  63 65 5F 6C  6F 63 61 74  6F 72 2E 65  37 service_locator.e
0000012C   6E 61 62 6C  65 3D 31 20  73 77 69 6F  74 6C 62 3D  32 30 34 38  nable=1 swiotlb=2048
00000140   20 61 6E 64  72 6F 69 64  62 6F 6F 74  2E 62 6F 6F  74 5F 64 65   androidboot.boot_de
00000154   76 69 63 65  73 3D 73 6F  63 2F 31 64  38 34 30 30  30 2E 75 66  vices=soc/1d84000.uf
00000168   73 68 63 20  61 6E 64 72  6F 69 64 62  6F 6F 74 2E  73 75 70 65  shc androidboot.supe
0000017C   72 5F 70 61  72 74 69 74  69 6F 6E 3D  73 79 73 74  65 6D 00 00  r_partition=system..
00000190   00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00  ....................
```

2. All you need to do here is `tab` over to the ascii side, and go right at the end `tag`. For this example it's `androidboot.super_partition=system`
3. press spacebar once and then type `androidboot.selinux=permissive`
Done. Go flash it!

- You literally never have to even open `boot.img`! 
- You don't have to worry about calculating offsets.

This is what it'll look like(for my visual learns):
```
00000000   41 4E 44 52  4F 49 44 21  0A 4A 15 01  00 80 00 00  8C 83 0F 01  ANDROID!.J..........
00000014   00 00 00 01  00 00 00 00  00 00 00 00  00 01 00 00  00 10 00 00  ....................
00000028   01 00 00 00  A1 01 00 20  00 00 00 00  00 00 00 00  00 00 00 00  ....... ............
0000003C   00 00 00 00  61 6E 64 72  6F 69 64 62  6F 6F 74 2E  63 6F 6E 66  ....androidboot.conf
00000050   69 67 66 73  3D 74 72 75  65 20 61 6E  64 72 6F 69  64 62 6F 6F  igfs=true androidboo
00000064   74 2E 68 61  72 64 77 61  72 65 3D 71  63 6F 6D 20  61 6E 64 72  t.hardware=qcom andr
00000078   6F 69 64 62  6F 6F 74 2E  75 73 62 63  6F 6E 74 72  6F 6C 6C 65  oidboot.usbcontrolle
0000008C   72 3D 61 36  30 30 30 30  30 2E 64 77  63 33 20 65  68 63 69 2D  r=a600000.dwc3 ehci-
000000A0   68 63 64 2E  70 61 72 6B  3D 33 20 66  69 72 6D 77  61 72 65 5F  hcd.park=3 firmware_
000000B4   63 6C 61 73  73 2E 70 61  74 68 3D 2F  76 65 6E 64  6F 72 2F 66  class.path=/vendor/f
000000C8   69 72 6D 77  61 72 65 5F  6D 6E 74 2F  69 6D 61 67  65 20 6C 6F  irmware_mnt/image lo
000000DC   6F 70 2E 6D  61 78 5F 70  61 72 74 3D  37 20 6C 70  6D 5F 6C 65  op.max_part=7 lpm_le
000000F0   76 65 6C 73  2E 73 6C 65  65 70 5F 64  69 73 61 62  6C 65 64 3D  vels.sleep_disabled=
00000104   31 20 6D 73  6D 5F 72 74  62 2E 66 69  6C 74 65 72  3D 30 78 32  1 msm_rtb.filter=0x2
00000118   33 37 20 73  65 72 76 69  63 65 5F 6C  6F 63 61 74  6F 72 2E 65  37 service_locator.e
0000012C   6E 61 62 6C  65 3D 31 20  73 77 69 6F  74 6C 62 3D  32 30 34 38  nable=1 swiotlb=2048
00000140   20 61 6E 64  72 6F 69 64  62 6F 6F 74  2E 62 6F 6F  74 5F 64 65   androidboot.boot_de
00000154   76 69 63 65  73 3D 73 6F  63 2F 31 64  38 34 30 30  30 2E 75 66  vices=soc/1d84000.uf
00000168   73 68 63 20  61 6E 64 72  6F 69 64 62  6F 6F 74 2E  73 75 70 65  shc androidboot.supe
0000017C   72 5F 70 61  72 74 69 74  69 6F 6E 3D  73 79 73 74  65 6D 20 61  r_partition=system a
00000190   6E 64 72 6F  69 64 62 6F  6F 74 2E 73  65 6C 69 6E  75 78 3D 70  ndroidboot.selinux=p
000001A4   65 72 6D 69  73 73 69 76  65 00 00 00  00 00 00 00  00 00 00 00  ermissive...........
```

## Actual setup:

**Don't flash this yet! This is just prep** 

1. Find the `system.img`.
	**Note:** On newer device you've to extract it from `super.img` I am not gonna cover it here-cause I haven't actually done it myself. (More about newer dynamic partition device at the end)
2. Mount it on your linux system like this: 
	```sh
	mkdir /mnt/system && mount -o loop system.img /mnt/system
	```
3. `cd /mnt/system` do the changes. (Leave `/bin`-android is sometimes extremely weird about it)
4. Make `/etc` a directory and not a symlink. 
	```sh
	rm -r ./etc && mkdir ./etc
	```
5. Copy over just the needed `cgroup.json` into `/etc`
	* **Note:** This is needed otherwise android will freak out after booting and pollute `/` with random `uid_*` directories (ask me how I know.)
6. Modify the `init.rc` it's in `/system/etc/init/hw/init.rc` (it might be elsewhere on your device so run: `find ./system | grep init.rc`)
7. Grab this new script from [here.](https://github.com/notfound8852/Andrunix-GNU/blob/main/Andrunix/scripts/rootfs) Just make sure to `chmod +x` it.
8. `init.rc` now becomes this:

```init.rc
on post-fs:
    ...

    mount rootfs rootfs / remount rw dev
    exec u:r:init:s0 -- /xbin/busybox umount /etc

    mount none /data/rootfs/etc /etc bind

    exec u:r:init:s0 -- /xbin/busybox mount -o remount,rw /

    exec u:r:init:s0 -- /xbin/busybox mount -o remount,dev,suid /data

    exec u:r:init:s0 -- /xbin/rootfs

    # just a little later so everything has mounted properly:

    start sshd
    ...

# # Define sshd as a native init service later in the file:
service sshd /usr/sbin/sshd -D
    class late_start
    user root
    group root
    seclabel u:r:init:s0
    disabled
    oneshot
```

**Important Explanation:** We've to make sshd an init service and not run it manually from a script unlike on the older setup.
This is because newer android has stricter cgroup management.

- Now inside your device make sure your rootfs is inside `/data/rootfs` and sshd is configured properly for password auth (you can change this later but for the first time logging in it's the easiest way to get in)
- Make sure to merge `/system/etc` with your `/data/rootfs/etc`:

```sh
cat /system/etc/hosts /data/rootfs/etc/hosts > /data/rootfs/new_hosts && \
cat /system/etc/group /data/rootfs/etc/group > /data/rootfs/new_group && \
cat /system/etc/passwd /data/rootfs/etc/passwd > /data/rootfs/new_passwd && \
cp -r /system/etc/* /data/rootfs/etc/ && \
mv /data/rootfs/new_passwd /data/rootfs/etc/passwd && \
mv /data/rootfs/new_group /data/rootfs/etc/group && \
mv /data/rootfs/new_hosts /data/rootfs/etc/hosts
```

That should be fine, ofc there are easier ways to do this. Also you don't have to merge these files(Newer Android literally doesn't care.) but you might as well.

---

## Sidenote (probably worth reading if you shit starts tweakin):

And actually you can configure `adb root` on most devices to make your life 10x easier after you take care of SeLinux ofc.
Right from where you are, you'll see `default.prop` open it.
Changes:
```
ro.debuggable=1
ro.secure=0
ro.adb.secure=0
```
And now you can use `adb root && adb shell` from your PC to get root access and debug away your problems.

---
9. `cd ~ && umount /mnt/system`

Now you should be good to flash.
If sshd doesn't let you in through password auth-you can always debug it with `adb root`


---
---

## Dynamic devices(Android 10+ that use a super.img):

You might be able to use fastbootd. To bypass all this but like I said, "I don't know." I haven't done it myself so all this is what I think how it'd work.
I'd recommend you copy this guide and put into an LLM to kinda guide you through if you're unsure.
## Baseline:

1. you have to first extract the `system.img` from the `super.img` or in the case of fastbootd just take it out from `/dev/block/by-name/system_a` or `system_b` depending on your A/B partition.
2. Run: `file system.img`:
 * If it's `erofs` Extract it out of `erofs` to `ext4`.
 * If it's already `ext4` keep reading forward dw about anything.
**Note:** Sometimes it'll say ext2-you're fine as long as it's not `erofs`
```sh
# e.g
system.img: Linux rev 1.0 ext2 filesystem data, UUID=87f8eb9c-b113-546d-a071-4412c6d150df (extents) (large files) (huge files)
```
* If it's `f2fs`. You're fine as well it's pretty much like `ext4` but better for NAND cases.

3. Mount the image. Make the modifications.
**NOTE:** You cannot rely on the `rootfs` script to do everything for you here(UNLESS your initial `file` command showed `ext4` then you're actually chilling)! You have to make the Linux distro paths here(`/usr`, `/home`, `/var`, etc, etc.)
4. Umount the image. convert the image back to `erofs`-again do this only if you initially started with an `erofs` image.

## Using fastbootd:

5. Flash using fastbootd- I believe it's something like this just make sure to verify everything:

```
fastboot getvar is-logical:system
```

6. if that returns `yes` proceed with the following if not. I'd stop here.

```
fastboot getvar partition-size:system_a # or system_b depending on what your active partion is.
```

7. This is gonna return some crazy shit like:
```
partition-size:system_a: 0x157C00000
```

8. take that `0x157C00000` and convert it from hex to decimal. In our example it'll be `5,767,168,000` just remove the comas (`5767168000`)
Then run the following:
```
fastboot delete-logical-partition system_a # or system_b depending on what your active partion is.
fastboot create-logical-partition system_a # that size in bytes here
```

## Example:
```
fastboot create-logical-partition system_a 2684354560
```

**Why this might work(in my head atleast):** Fastbootd is kind of special. It knows about the dynamic partition it can slide the system.img into the right spot without you having to mess with the whole `super.img`
9. Flash:
```
fastboot flash system_a system.img
```

---

## For`super.img`:

The steps are pretty much the same. But instead you'd do something like this:
5. remake the `super.img`
3. flash the entire `super.img`
