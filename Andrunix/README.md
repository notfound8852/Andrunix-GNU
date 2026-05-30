This as of right now only works for Android 9 and below. [More about that..](https://github.com/notfound8852/Andrunix-GNU/blob/main/Andrunix/Some-explanations/Newer%20vs%20Older%20Android.md)

Before starting **YOU MUST READ THE PREREQUISISTES.md FILE..**

# **WARNINGS:**
**DO ALL OF THIS AT YOUR OWN RISK!!**
LIST OF ALL THE WARNINGS:
* You mess up your device. I aint even gettin involved. **DO NOT EVEN ATTEMPT TO REACH OUT..**
* This does cover how to turn off selinux **PERMINATELY**. Be warned because this removes a layer of security..
* Must note that if your device is rooted with something like magisk the root ***will*** break..
* You **must** know how to recover your device in case something breaks. (ps: make a back up of your boot.img)
* The following steps modifies the system be prepared mentally if something breaks your precision devices cause you gonna sit there and fix it..
* **This method is experimental**, and unexpected behavior may occur.
* **Running glibc binaries on Android is unsupported especially directly/natively (Tho i beg to differ cause this guide does all that precisely)** expect breakage, instability, or security risks.
* **OPTIONALLY:** **Do not attempt this on a production device.** Use a test device or an old phone you don’t care about.
* **DO NOT ASK FOR SUPPORT IF YOU BREAK YOUR DEVICE.** You have been warned.

---
---
## **Main tutorial:**

1. Non-Root folks will need to perform additional steps. **[here](https://github.com/notfound8852/Andrunix-GNU/blob/main/Andrunix/Device-setup/Non-root.md)**

2. For the people who have Root: **[here](https://github.com/notfound8852/Andrunix-GNU/blob/main/Andrunix/Device-setup/Root.md)**

3. boot.img modifications.. **[here](https://github.com/notfound8852/Andrunix-GNU/blob/main/Andrunix/Boot-modifications/README.md)**

4. To connect to root get a ssh client and run `ssh roo@127.0.0.1 -p 22`. You can do this in termux or get a seperate app that lets you do this.
