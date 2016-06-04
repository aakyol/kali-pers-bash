#!/bin/bash
#copyright Aydın Akyol 2016
echo "Enter the USB mount point to apply persistence on a partiton: "
read USBport
mkfs.ext3 -L persistence /dev/$USBport
e2label /dev/$USBport persistence
mkdir -p /mnt/my_usb
mount /dev/$USBport /mnt/my_usb
echo "/ union" > /mnt/my_usb/persistence.conf
umount /dev/$USBport
echo "Persistence process is completed on the bash side." 
echo "Please check if the persistence is consistent, by simply restart the OS, create a file on desktop, and restart the OS again."
