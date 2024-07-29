# Ubuntu Touch adaptation for the LG V60 ThinQ 5G

This is based on Halium 11.0, and uses the mechanism described in [this page](https://github.com/ubports/porting-notes/wiki/GitLab-CI-builds-for-devices-based-on-halium_arm64-(Halium-9)).

## How to build
To manually build this project, follow these steps:

```bash
./build.sh -b workdir  # workdir is the name of the build directory
./build/prepare-fake-ota.sh out/device_pro1x.tar.xz ota
./build/system-image-from-ota.sh ota/ubuntu_command out
```

## Install
 1. Make a backup of your device partitions
 
 2. Unlock the device bootloader following the usual unlock procedure (enable Developer mode, turn on "OEM unlocking" option, then reboot to bootloader and execute `fastboot oem unlock`)
 
 ** Note:
 recovery.img is current not being compiled, once the port is more complete this will start to be compiled.
 Step 3 can be skipped for the time being.
 
 3. Reboot to bootloader, flash recovery.img from the images folder, then reboot to fastboot mode:
```bash
fastboot format:ext4 userdata
fastboot --set-active=a
fastboot flash recovery out/recovery.img
fastboot reboot fastboot
```
 4. Flash boot.img and copy ubuntu.img, then reboot:
```bash
fastboot flash boot_a out/boot.img
fastboot flash dtbo_a out/dtbo.img
fastboot reboot recovery
adb push images/rootfs.img /data/ubuntu.img
```
