#!/bin/bash

# Variables
CHROOT_DIR="/data/chroot"

# Ensure directory is clear or create it if not exists
sudo rm -rf $CHROOT_DIR
mkdir -p $CHROOT_DIR

# Ensure debootstrap is installed
sudo apt-get update && sudo apt-get install -y debootstrap

# Run debootstrap on host
sudo debootstrap --arch=amd64 bookworm $CHROOT_DIR http://deb.debian.org/debian/
