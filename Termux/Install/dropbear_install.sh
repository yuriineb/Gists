#!/system/bin/sh

pkg upgrade
pkg install dropbear
apt update && apt upgrade
passwd
