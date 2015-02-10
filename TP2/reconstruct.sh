#!/bin/bash

set -x

cd initrd
find ./ | cpio -H newc -o > ../new-initrd.cpio
cd ..
gzip -9 new-initrd.cpio
mv new-initrd.cpio.gz new-initrd.img
