

#set -x

#./rebuild.sh

rm -rf initrd
mkdir initrd
cd initrd
gzip -dc ../initrd-BIG.img | cpio -id
cd ..

#./suppr.sh

cd initrd


rm -rf conf
rm -rf sbin
rm -rf scripts
rm -rf modules
rm -rf etc/

cd lib

rm -rf udev
rm -rf modules
rm -rf klibc-rOj3PRLKBA9FcF5ZuoqKQLmOWcA.so
rm -rf libdevmapper.so.1.02
rm -rf libdl.so.2
rm -rf libncurses.so.5
rm -rf libreadline.so.5
rm -rf libselinux.so.1
rm -rf libsepol.so.1
rm -rf libvolume_id.so.0

cd ../bin

rm -rf cat
rm -rf chroot
rm -rf dd
rm -rf false
rm -rf fstype
rm -rf gunzip
rm -rf halt
rm -rf insmod
rm -rf ipconfig
rm -rf kill
rm -rf kinit.shared
rm -rf ln
rm -rf minips
rm -rf mkdir
rm -rf mkfifo
rm -rf mknod
rm -rf mount
rm -rf nfsmount
rm -rf nuke
rm -rf poweroff
rm -rf pivot_root
rm -rf readlink
rm -rf reboot
rm -rf resume
rm -rf run-init
rm -rf sh.shared
rm -rf sleep
rm -rf true
rm -rf umount
rm -rf uname
rm -rf zcat
rm -rf  sh
ln -s busybox sh

cd ../..

#./reconstruct.sh

cd initrd
find ./ | cpio -H newc -o > ../new-initrd.cpio
cd ..
gzip -9 new-initrd.cpio
mv new-initrd.cpio.gz new-initrd.img

#test du code élagué
qemu -kernel ./vmlinuz-2.6.18-4-686 -initrd ./new-initrd.img -hda /dev/zero

ls -l
