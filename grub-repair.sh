#!/bin/sh
echo 
while true; do
	read -p "WARNING: THIS SCRIPT SHOULD ONLY BE RUN FROM A LIVE USB ENV. DOING SO OTHERWISE CAN SERIOUSLY SCREW UP YOUR SYSTEM BOOT. DO NOT RUN THIS SCRIPT IF YOU DON'T KNOW WHAT YOU'RE DOING! Proceed anyways? [yes/no]" yesno
	case $yesno in
    [Yes]* )
        echo "Starting repair"
        manjaro-chroot -a 
        grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=manjaro --recheck --no-rs-codes --verbose
        exit
        reboot
    [No]* )
        echo "canceling..."
    esac
done