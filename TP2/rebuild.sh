#!/bin/bash

set -x

rm -rf initrd
mkdir initrd
cd initrd
gzip -dc ../initrd-BIG.img | cpio -id
