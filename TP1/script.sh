#!/bin/bash

set -x

dd if=/dev/zero of=boot.img count=256 bs=1k
mkfs.msdos boot.img
#od -a boot.img
mkdir -p fs
mount -o loop boot.img fs/
cp memtest86+-5.01.bin fs/memtest
cat > fs/display.txt << EOF
HELLO WORLD!
Trust me, I am the Doctor !
EOF

cat > fs/syslinux.cfg << EOF
display display.txt
default memtest
label memtest
kernel memtest
implicit 0
prompt 1
timeout 80
EOF

sync
umount ./boot.img
syslinux ./boot.img
qemu ./boot.img
