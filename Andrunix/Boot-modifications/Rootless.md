1. Aight so what you will need for this is this other script.
**[initial_setup](https://github.com/notfound8852/Andrunix-GNU/Andrunix/scripts/initial_script.sh)**
2. put it inside of `xbin`
```sh
nano initial_setup.sh # paste the script in here
chmod +x ./initial_setup.sh
```
3. go back one directory and add this line in init.rc. 
After post-fs-data and at the very end of that section before the services and  `restorecon --recursive --skip-ce /data` or something similar add this, then save and exit:
```bash
exec u:r:init:s0 -- /xbin/initial_setup.sh
```
if you are unsure, refer to [this](https://github.com/notfound8852/Andrunix-GNU/Andrunix/Boot-modifications/examples.md)

4. You are done! just pack up the boot.img. **MAKE SURE YOU ARE IN** ramdisk!!!
```bash
find . | cpio -o --format=newc | gzip > ../initrd.img && \
cd ..
```

5. Check your boot.img config file. 
```bash
cat bootimg.cfg
```
and accordingly pack up your image using mkbootimg.. check examples.md for a quick tutorial on what to do. [here](https://github.com/notfound8852/Andrunix-GNU/Andrunix/Boot-modifications/examples.md)

6. Flash this image using fastboot commands please go watch a tutorial if you don't know how to do this..

7. After flashing boot the device normally.. wait for a bit and then power off the device or go back to bootloader

8. During the main boot-modifications guide make sure to remove this line from the init.rc that you just added in this guide:
```bash
exec u:r:init:s0 -- /xbin/initial_setup.sh
```
**PLEASE DO SO OTHERWISE IT WILL START TO SLOW DOWN YOUR BOOT PROCESS.**

9. Go back to the main guide for boot-modifications after this. [here]().


---
---
