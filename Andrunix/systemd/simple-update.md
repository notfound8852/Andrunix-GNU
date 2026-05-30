So I have been kind of busy with some stuff lately now yes I posted this repo yesterday but I still haven't gotten around to trying or even attempting sysetmd as pid 1. Still no idea what happens how it even behaves for now I just wanted to drop a quick little update on some logs from systemd that i got when testing it.
```bash
Successfully forked off '(pager)' as PID 11522.
Skipping PR_SET_MM, as we don't have privileges.
sd_pid_get_owner_uid() failed, enabling pager secure mode: No such process
Failed to execute 'less', will try 'more' next: No such file or directory
Pager executable is "(built-in)", options "FRSXMK", quit_on_interrupt: yes
systemd 256.5-2ubuntu3.1 running in  testuser mode for user 2902/notfound. (+PAM +AUDIT +SELINUX +APPARMOR +IMA +SMACK +SECCOMP +GCRYPT -GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK -XKBCOMMON +UTMP +SYSVINIT +LIBARCHIVE)
Found cgroup on /sys/fs/cgroup/systemd, legacy hierarchy
Using cgroup controller name=systemd. File system hierarchy is at /sys/fs/cgroup/systemd.
bpf-firewall: Not running with unified cgroup hierarchy, BPF firewalling is not supported.
Not enough privileges, BPF device control is not supported.
Not running with unified cgroup hierarchy, disabling cgroup BPF features.
Controller 'cpu' supported: no
Controller 'cpuacct' supported: no
Controller 'cpuset' supported: no
Controller 'io' supported: no
Controller 'blkio' supported: no
Controller 'memory' supported: no
Controller 'devices' supported: no
Controller 'pids' supported: no
Controller 'bpf-firewall' supported: no
Controller 'bpf-devices' supported: no
Controller 'bpf-foreign' supported: no
Controller 'bpf-socket-bind' supported: no
Controller 'bpf-restrict-network-interfaces' supported: no
Failed to establish memory pressure event source, ignoring: Operation not supported
Using systemd-executor binary from '/usr/lib/systemd/systemd-executor'.
Serializing user-environment-generators to /tmp.
Successfully forked off '(sd-exec-strv)' as PID 11523.
Skipping PR_SET_MM, as we don't have privileges.
Serializing 30-systemd-environment-d-generator to /tmp.
About to execute /usr/lib/systemd/user-environment-generators/30-systemd-environment-d-generator
Successfully forked off '(direxec)' as PID 11524.
Looking for environment.d files in (higher priority first):
        /home/notfound/.config/environment.d
        /etc/environment.d
        /run/environment.d
        /usr/local/lib/environment.d
        /usr/lib/environment.d
Reading /usr/lib/environment.d/99-environment.conf…
/usr/lib/environment.d/99-environment.conf:2: setting PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
/usr/lib/systemd/user-environment-generators/30-systemd-environment-d-generator succeeded.
(sd-exec-strv) succeeded.
Failed to read $container of PID 1, ignoring: No such process
Found container virtualization none.
No virtualization found in DMI vendor table.
Unable to read /sys/firmware/dmi/entries/0-0/raw, using the virtualization information found in DMI vendor table, ignoring: No such file or directory
UML virtualization not found in /proc/cpuinfo.
Virtualization XEN not found, /proc/xen does not exist
No virtualization found in CPUID
No virtualization found in /proc/device-tree/*
This platform does not support /proc/sysinfo
Found VM virtualization none
No confidential virtualization detection on this architecture
Successfully forked off '(sd-exec-strv)' as PID 11525.
Skipping PR_SET_MM, as we don't have privileges.
About to execute /usr/lib/systemd/user-generators/systemd-xdg-autostart-generator (null)
Successfully forked off '(direxec)' as PID 11526.
Scanning autostart directory "/home/notfound/.config/autostart"…
Opening /home/notfound/.config/autostart failed, ignoring: No such file or directory
Scanning autostart directory "/etc/xdg/autostart"…
/etc/xdg/autostart/xdg-user-dirs.desktop: GNOME startup phases are handled separately, marking as NotShowIn=GNOME.
/etc/xdg/autostart/xdg-user-dirs.desktop: symlinking app-xdg\x2duser\x2ddirs@autostart.service in xdg-desktop-autostart.target/.wants…
/usr/lib/systemd/user-generators/systemd-xdg-autostart-generator succeeded.
(sd-exec-strv) succeeded.
Looking for unit files in (higher priority first):
        /home/notfound/.config/systemd/user.control
        /run/user/2902/systemd/user.control
        /tmp/systemd-temporary-xUitEB/transient
        /tmp/systemd-temporary-xUitEB/generator.early
        /home/notfound/.config/systemd/user
        /etc/xdg/systemd/user
        /etc/systemd/user
        /run/user/2902/systemd/user
        /run/systemd/user
        /tmp/systemd-temporary-xUitEB/generator
        /home/notfound/.local/share/systemd/user
        /usr/local/share/systemd/user
        /usr/share/systemd/user
        /usr/local/lib/systemd/user
        /usr/lib/systemd/user
        /tmp/systemd-temporary-xUitEB/generator.late
Unit type .automount is not supported on this system.
Modification times have changed, need to update cache.
unit_file_build_name_map: normal unit file: /usr/lib/systemd/user/background.slice
unit_file_build_name_map: normal unit file: /usr/lib/systemd/user/basic.target
unit_file_build_name_map: normal unit file: /usr/lib/systemd/user/bluetooth.target
unit_file_build_name_map: normal unit file: /usr/lib/systemd/user/capsule@.target
unit_file_build_name_map: normal unit file: /usr/lib/systemd/user/default.target
unit_file_build_name_map: normal unit file: /usr/lib/systemd/user/exit.target
unit_file_build_name_map: normal unit file: /usr/lib/systemd/user/graphical-session-pre.target
unit_file_build_name_map: normal unit file: /usr/lib/systemd/user/graphical-session.target
unit_file_build_name_map: normal unit file: /usr/lib/systemd/user/paths.target
unit_file_build_name_map: normal unit file: /usr/lib/systemd/user/printer.target
unit_file_build_name_map: normal unit file: /usr/lib/systemd/user/session.slice
unit_file_build_name_map: normal unit file: /usr/lib/systemd/user/shutdown.target
unit_file_build_name_map: normal unit file: /usr/lib/systemd/user/smartcard.target
unit_file_build_name_map: normal unit file: /usr/lib/systemd/user/sockets.target
unit_file_build_name_map: normal unit file: /usr/lib/systemd/user/sound.target
unit_file_build_name_map: normal unit file: /usr/lib/systemd/user/systemd-exit.service
unit_file_build_name_map: normal unit file: /usr/lib/systemd/user/systemd-tmpfiles-clean.service
unit_file_build_name_map: normal unit file: /usr/lib/systemd/user/systemd-tmpfiles-clean.timer
unit_file_build_name_map: normal unit file: /usr/lib/systemd/user/systemd-tmpfiles-setup.service
unit_file_build_name_map: normal unit file: /usr/lib/systemd/user/timers.target
unit_file_build_name_map: normal unit file: /usr/lib/systemd/user/xdg-desktop-autostart.target
unit_file_build_name_map: normal unit file: /usr/lib/systemd/user/dbus.socket
unit_file_build_name_map: normal unit file: /usr/lib/systemd/user/dbus.service
unit_file_build_name_map: normal unit file: /usr/lib/systemd/user/ssh-agent.service
unit_file_build_name_map: normal unit file: /usr/lib/systemd/user/launchpadlib-cache-clean.timer
unit_file_build_name_map: normal unit file: /usr/lib/systemd/user/app.slice
unit_file_build_name_map: normal unit file: /usr/lib/systemd/user/launchpadlib-cache-clean.service
unit_file_build_name_map: normal unit file: /tmp/systemd-temporary-xUitEB/generator.late/app-xdg\x2duser\x2ddirs@autostart.service
blockdev@dev-block-platform-soc.0-7824900.sdhci-by\x2dname-system.target: Failed to load configuration: No such file or directory
usr.mount: Failed to load configuration: No such file or directory
usr-sbin-.magisk.mount: Failed to load configuration: No such file or directory
home.mount: Failed to load configuration: No such file or directory
home-notfound.mount: Failed to load configuration: No such file or directory
blockdev@dev-block-bootdevice-by\x2dname-cache.target: Failed to load configuration: No such file or directory
dev.mount: Failed to load configuration: No such file or directory
sys.mount: Failed to load configuration: No such file or directory
sys-kernel.mount: Failed to load configuration: No such file or directory
blockdev@dev-block-bootdevice-by\x2dname-persist.target: Failed to load configuration: No such file or directory
blockdev@dev-block-bootdevice-by\x2dname-dsp.target: Failed to load configuration: No such file or directory
blockdev@dev-block-bootdevice-by\x2dname-modem.target: Failed to load configuration: No such file or directory
blockdev@dev-block-bootdevice-by\x2dname-asdf.target: Failed to load configuration: No such file or directory
blockdev@dev-block-bootdevice-by\x2dname-quality.target: Failed to load configuration: No such file or directory
blockdev@dev-block-dm\x2d0.target: Failed to load configuration: No such file or directory
dev-usb\x2dffs.mount: Failed to load configuration: No such file or directory
sd-device-monitor(n/a): The udev service seems not to be active, disabling the monitor.
sd-device-monitor(n/a): Unable to get network namespace of udev netlink socket, unable to determine if we are in host netns, ignoring: Operation not supported
Unit type .automount is not supported on this system.
dev-zram0.mount: Failed to load configuration: No such file or directory
blockdev@dev-block-zram0.target: Failed to load configuration: No such file or directory
dev-block.mount: Failed to load configuration: No such file or directory
dev-block-zram0.mount: Failed to load configuration: No such file or directory
mnt-runtime.mount: Failed to load configuration: No such file or directory
mnt-runtime-write.mount: Failed to load configuration: No such file or directory
mnt-runtime-read.mount: Failed to load configuration: No such file or directory
mnt-runtime-default.mount: Failed to load configuration: No such file or directory
Failed to bind private socket: No such file or directory
Bus bus-system: changing state UNSET → OPENING
sd-bus: starting bus bus-system by connecting to /run/dbus/system_bus_socket...
Failed to determine peer pidfd, ignoring: Protocol not available
Bus bus-system: changing state OPENING → AUTHENTICATING
Successfully connected to system bus.
Invoking unit coldplug() handlers…
dev-block-zram0.swap: Changed dead -> active
-.slice: Changed dead -> active
-.mount: Changed dead -> mounted
dev-zram0.swap: Changed dead -> active
init.scope: Changed dead -> running
Invoking unit catchup() handlers…
mnt-runtime-write-emulated.mount: Changed dead -> mounted
asdf.mount: Changed dead -> mounted
boot.mount: Changed dead -> mounted
mnt-runtime-default-emulated.mount: Changed dead -> mounted
acct.mount: Changed dead -> mounted
storage.mount: Changed dead -> mounted
usr.mount: Changed dead -> mounted
dev-block-platform-soc.0-7824900.sdhci-by\x2dname-system.device: Changed dead -> tentative
opt.mount: Changed dead -> mounted
sys-kernel-debug.mount: Changed dead -> mounted
dev-block-bootdevice-by\x2dname-dsp.device: Changed dead -> tentative
system.mount: Changed dead -> mounted
dev-block-bootdevice-by\x2dname-quality.device: Changed dead -> tentative
media.mount: Changed dead -> mounted
usr-sbin-.magisk-worker.mount: Changed dead -> mounted
tmp.mount: Changed dead -> mounted
dev-block-bootdevice-by\x2dname-persist.device: Changed dead -> tentative
dev-block-bootdevice-by\x2dname-cache.device: Changed dead -> tentative
dev-block-dm\x2d0.device: Changed dead -> tentative
mnt-runtime-read-emulated.mount: Changed dead -> mounted
cache.mount: Changed dead -> mounted
storage-emulated.mount: Changed dead -> mounted
firmware.mount: Changed dead -> mounted
mnt.mount: Changed dead -> mounted
root.mount: Changed dead -> mounted
data.mount: Changed dead -> mounted
var.mount: Changed dead -> mounted
vzw.mount: Changed dead -> mounted
dev-usb\x2dffs-adb.mount: Changed dead -> mounted
dev-block-bootdevice-by\x2dname-asdf.device: Changed dead -> tentative
home.mount: Changed dead -> mounted
srv.mount: Changed dead -> mounted
config.mount: Changed dead -> mounted
dev-block-zram0.device: Changed dead -> tentative
dev-block-bootdevice-by\x2dname-modem.device: Changed dead -> tentative
dev-cpuctl.mount: Changed dead -> mounted
usr-sbin.mount: Changed dead -> mounted
dsp.mount: Changed dead -> mounted
persist.mount: Changed dead -> mounted
system-etc.mount: Changed dead -> mounted
Activating default unit: multi-user.target
multi-user.target: Failed to load configuration: No such file or directory
Unit multi-user.target not found.
Falling back to rescue.target.
rescue.target: Failed to load configuration: No such file or directory
Unit rescue.target not found.
Bus bus-system: changing state AUTHENTICATING → HELLO
Sent message type=method_call sender=n/a destination=org.freedesktop.DBus path=/org/freedesktop/DBus interface=org.freedesktop.DBus member=Hello cookie=1 reply_cookie=0 signature=n/a error-name=n/a error-message=n/a
Sent message type=method_call sender=n/a destination=org.freedesktop.DBus path=/org/freedesktop/DBus interface=org.freedesktop.DBus member=AddMatch cookie=2 reply_cookie=0 signature=s error-name=n/a error-message=n/a
Got message type=method_return sender=org.freedesktop.DBus destination=:1.16 path=n/a interface=n/a member=n/a  cookie=1 reply_cookie=1 signature=s error-name=n/a error-message=n/a
Bus bus-system: changing state HELLO → RUNNING
Bus bus-system: changing state RUNNING → CLOSED
```
These are logs for when the device was on. Not to be confused with it being PID 1 logs.. Getting to this point is easy but I am still not sure what happens at the PID 1 level. Once I do eventually get around to it. I will post an update.

