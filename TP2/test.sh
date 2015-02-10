#!/bin/bash

set -x

qemu -kernel ./vmlinuz-2.6.18-4-686 -initrd ./new-initrd.img -hda /dev/zero
