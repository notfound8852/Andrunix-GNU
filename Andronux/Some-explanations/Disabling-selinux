## What is selinux:
SeLinux is a security module built into the android kernel and many linux kernels. I say many is because most of them have it disabled entirely while some do run selinux.
SeLinux on android is for security and allows or denies access to various directories.. Think of it as a permission manager.

## Why disable it?
SELINUX BREAKS THIS ENTIRE SETUP..
SeLinux gets in the way of the entire setup.. Selinux will make it so access to the entire OS is very restricted.. The enforcing nature of it, is what makes it so diffcult to work with. Disabling seLinux in the cmdline is gernerally not a good idea. But lets be honest linux does'nt have a `enforcing` mode now does it? 
Disabling seLinux allows access to the OS especially the / directory and some read access to /system even if dm-0 verity is on.. 

## Quick sum up:
Basically with seLinux on even `Root` will not let you mess with the system because of "access denied errors" and running `apt update` with this junk on is a nightmare.. SO PLEASE TURN IT OFF!!
