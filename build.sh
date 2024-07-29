#!/bin/bash
set -xe

[ -d build ] || git clone https://gitlab.com/ubports/community-ports/halium-generic-adaptation-build-tools -b halium-11 build

# Unpack python3-evdev to overlay until it is added to rootfs
[ -f python3-evdev_1.3.0+dfsg-1build1_arm64.deb ] || wget http://ports.ubuntu.com/ubuntu-ports/pool/universe/p/python-evdev/python3-evdev_1.3.0+dfsg-1build1_arm64.deb
dpkg-deb -x python3-evdev_1.3.0+dfsg-1build1_arm64.deb "overlay/system"

./build/build.sh "$@"
