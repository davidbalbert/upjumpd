#!/bin/sh

qemu-system-aarch64 -machine virt -accel hvf -cpu host -m 256 -kernel buildroot/output/images/Image -nographic -serial mon:stdio
