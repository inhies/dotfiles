#!/bin/bash
# 
# Version 1.4
#
# twrp.sh -- a TWRP compatible backup script for your computer
# Brought to you by inhies
#
# This script creates TWRP compatible backups over usb using adb and magikz
# By default it makes a folder in the standard TWRP date--time format (I think)
# To restore these backups, place the folder in /sdcard/TWRP/BACKUPS/<serialnumber>/
#
# If you can figure out a better way to run the two netcat downloads in parallel 
# I would be forever grateful
#
# USAGE: Boot your phone in to TWRP, then run this script
#
# Currently only backs up /data, /system, and /boot which mactches TWRPs default.
# It will also ignore /data/media files (like TWRP does)
#
# This might not work so well on anything other than a Nexus 4 ¯(°_o)/¯

# Specify your boot partition below:

BOOT_PARTITION="/dev/block/platform/msm_sdcc.1/by-name/boot" #Nexus 4
BOOT_NOTE="Nexus 4" # This isn't required, it's just for logging
                    # You can change it if you have multiple copies of this file 

# To find your boot partition, reboot in to twrp, then run 
# adb shell cat /etc/recovery.fstab | grep /boot
# The last line on the right is (should be?) your boot partition

SYSTEM_START_MESSAGE="Backing up /system..."
SYSTEM_DONE_MESSAGE="/system backup complete!"
DATA_START_MESSAGE="Backing up /data..."
DATA_DONE_MESSAGE="/data backup complete!"
BOOT_START_MESSAGE="Backing up /boot for a $BOOT_NOTE from $BOOT_PARTITION..."
BOOT_DONE_MESSAGE="/boot backup complete!"

adb shell mount -r /system

FOLDER=`date '+%Y-%m-%d--%H-%M-%S'`
mkdir $FOLDER; cd $FOLDER

echo "Backup started in $FOLDER"

# Setup 
adb forward tcp:5550 tcp:5550
adb shell "rm -rf /tmp/sys_fifo && mkfifo /tmp/sys_fifo && cd /system/ && tar -cz -f /tmp/sys_fifo * & nc -l -p 5550 -e cat /tmp/sys_fifo" &
adb forward tcp:5551 tcp:5551
adb shell "rm -rf /tmp/data_fifo && mkfifo /tmp/data_fifo && cd /data/ && tar -cz --exclude='media*' -f /tmp/data_fifo * & nc -l -p 5551 -e cat /tmp/data_fifo" &
adb forward tcp:5552 tcp:5552
adb shell "rm -rf /tmp/boot_fifo && mkfifo /tmp/boot_fifo && dd if=$BOOT_PARTITION of=/tmp/boot_fifo  & nc -l -p 5552 -e cat /tmp/boot_fifo" &

sleep 1

# Backup /system
(
  nc 127.0.0.1 5550 > system.ext4.win
  md5sum system.ext4.win > system.ext4.win.md5
  echo $SYSTEM_DONE_MESSAGE
) | tee -a recovery.log &
SYS_PID=$!
echo $SYSTEM_START_MESSAGE | tee -a recovery.log

# Backup /data
(
  nc 127.0.0.1 5551 > data.ext4.win 
  md5sum data.ext4.win > data.ext4.win.md5
  echo $DATA_DONE_MESSAGE
) | tee -a recovery.log &
DATA_PID=$!
echo $DATA_START_MESSAGE | tee -a recovery.log

# Backup /boot
(
  nc 127.0.0.1 5552 > boot.emmc.win 
  md5sum boot.emmc.win > boot.emmc.win.md5
  echo $BOOT_DONE_MESSAGE
) | tee -a recovery.log &
BOOT_PID=$!
echo $BOOT_START_MESSAGE | tee -a recovery.log

wait $SYS_PID $DATA_PID $BOOT_PID

echo "Done!" | tee -a recovery.log

adb shell umount /system