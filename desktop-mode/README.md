
## Legacy guide:

This is for the folks who have `/dev/graphics/fb0`
Also make sure your root the whole time through this process. You can configure XFCE4 for your user later. Just get familar with the steps first.

1. Pop a root shell on your device.
2. Install all the legacy XFCE4 destkop stuff(you can also use legacy plasma).

```sh
sudo apt install xfce4 xfce4-goodies xinit
# for arch based systems.
sudo pacman -Syu xfce4 xfce4-goodies xorg-xinit
# Fedora:
sudo dnf groupinstall "Xfce"
sudo dnf install xorg-x11-xinit
```
3. Install systemd services:
```sh
sudo apt install systemd systemd-sysv systemd-timesyncd systemd-journal-remote libsystemd-dev network-manager udev dbus
```

## 4. Hardware handler(systemd-logind):

Since you're gonna be switching off of SF(surfaceflinger-the thing that manages your android display stack) a bunch of the control is also gonna disappear (the touchscreen, power buttons, etc)
You need something to manage that for you, in our case it'll be systemd-logind.

**IMPORTANT: **
* You either have to blind SF or kill it entirely for this otherwise you're device will crash!
* I am gonna mention this right here, right now. Make sure you have some way to access the device cause the next steps are details on how to disable the display stack.
* adb root, or `ssh`ing into the device is fine.


---
---

## How to blind it:
```
mount -t tmpfs tmpfs /dev/graphics
```

---

## How to disable it:
```
setprop ctl.stop surfaceflinger && setprop ctl.stop # your hwcomposer name here
```
hwcomposer is annoying cause you kinda just have to guess what it's called like for example:
```
getprop | grep composer
init.svc.vendor.qti.hardware.display.composer]: [running]
[init.svc_debug_pid.vendor.qti.hardware.display.composer]: [1108]
[ro.boottime.vendor.qti.hardware.display.composer]: [6483229996]

lsof | grep "composer"
composer-servic  1108     system    8u      CHR              226,0       0t0      29941 /dev/graphics/fb0

find /vendor | grep "composer" 
/vendor/bin/hw/vendor.qti.hardware.display.composer-service
/vendor/etc/init/vendor.qti.hardware.display.composer-service.rc
/vendor/etc/vintf/manifest/vendor.qti.hardware.display.composer-service.xml
/vendor/lib64/android.hardware.graphics.composer@2.1.so
/vendor/lib64/android.hardware.graphics.composer@2.2.so
/vendor/lib64/android.hardware.graphics.composer@2.3.so
/vendor/lib64/android.hardware.graphics.composer@2.4.so
/vendor/lib64/vendor.qti.hardware.display.composer@3.0.so
```
All that and it was called: `vendor.hwcomposer-2-3` 🥀
So you'd run:
```
setprop ctl.stop surfaceflinger && setprop ctl.stop vendor.hwcomposer-2-3
```

---

Hopefully you have a way to still communicate with the device cause now you're gonna wanna run:
```sh
sudo mkdir -p /run/systemd/private 
sudo chmod 700 /run/systemd/private
export SYSTEMD_RUNTIME_DIRECTORY=/run/systemd
export XDG_RUNTIME_DIR=/run/user/$(id -u)
sudo mkdir -p $XDG_RUNTIME_DIR
sudo chmod 777 $XDG_RUNTIME_DIR
/usr/bin/dbus-daemon --system --nofork --nopidfile
/usr/lib/systemd/systemd-udevd --daemon
/usr/bin/udevd --trigger
```
After that. Try:
```
/usr/lib/systemd/systemd-logind
```
If you see it list out stuff about your screen, your power buttons, etc. Everything went well. you can now `reboot` the device.

---

5. Now that you're back into your device. The next steps are simple. In your terminal do:
```
sudo mkdir -p /run/systemd/private 
sudo chmod 700 /run/systemd/private
export XDG_RUNTIME_DIR=/run/user/$(id -u)
sudo mkdir -p $XDG_RUNTIME_DIR
sudo chmod 777 $XDG_RUNTIME_DIR

mount -t tmpfs tmpfs /dev/graphics
sudo mknod /dev/fb0 c 29 0
/usr/bin/dbus-daemon --system --nofork --nopidfile &
/usr/lib/systemd/systemd-logind &
exec dbus-launch --exit-with-session startxfce4 &
```

**NOTE:** You might need to press the power button twice to do a quick on/off to make sure everything draws properly.
But yea. You should now-hopefully be staring at a desktop now. Also consider adding:
```
sudo mkdir -p /run/systemd/private
sudo chmod 700 /run/systemd/private
export XDG_RUNTIME_DIR=/run/user/$(id -u)
sudo mkdir -p $XDG_RUNTIME_DIR
sudo chmod 777 $XDG_RUNTIME_DIR
```
to your `bashrc` or `zshrc`

These to init.rc:
```
on property:sys.boot_completed=1
	...
	exec u:r:init:s0 -- /xbin/busybox mknod /dev/fb0 c 29 0
	start dbus-daemon
	start systemd-logind

# at the end of the file
service dbus-daemon /usr/bin/dbus-daemon --system --nofork --nopidfile
	class late_start
	user root
	group root
	seclabel u:r:init:s0
	disabled
	oneshot

service systemd-logind /usr/lib/systemd-logind
	class late_start
	user root
	group root
	seclabel u:r:init:s0
	disabled
	oneshot
```

## How to switch back to Android:
1. Stop XFCE4.
2. `umount /dev/graphics`
3. Press the power button twice to reload the screen.

- Another thing, I'd like to mention is that you *could* theoretically `rm /dev/fb0` and `umount /dev/graphics` to have XFCE4 loaded in the bg while you do whatever you want on android but I never actually tested this myself so I can't say for sure this works.

---

And with that you officially have the greatest runtime switch between android and XFCE4 on a legacy device.

## Quick points:

* `mount -t tmpfs tmpfs /dev/graphics` on devices with `/dev/graphics/fb0` works quite well in preserving SF's state.
	- So think like you're apps, you're whatever that you want to keep open and alive, stay alive(atleast for a good bit) whereas `setprop ctl.stop surfaceflinger` just fully kills it-which is also fine if that's what you want.
* `udevd --trigger` is needed only initially to generate udev entries so `systemd-logind` can manage your hardware.
* `dbus-daemon` must be running for `systemd-logind` to work.

---
---

## DRM/KMS:

I am working on it.. 🙃✌️
(Atleast for downstream snapdragon devices.)
