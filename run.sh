#!/bin/sh

qemu-system-aarch64 \
    -machine virt \
    -accel hvf \
    -cpu host \
    -m 256 \
    -nographic \
    -serial mon:stdio \
    -drive file=buildroot/output/images/rootfs.squashfs,format=raw,if=none,id=hd0 \
    -device virtio-blk-device,drive=hd0 \
    -netdev user,id=net0 \
    -device virtio-net-device,netdev=net0 \
    -kernel buildroot/output/images/Image \
    -append "console=ttyAMA0 root=/dev/vda"
