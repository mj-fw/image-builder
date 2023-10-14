# Start with a Debian base image
FROM debian:bookworm
COPY chroot/ /

# Set environment to non-interactive (avoid prompts)
ENV DEBIAN_FRONTEND=noninteractive

# Update and install build tools
RUN apt update && apt upgrade -y \
	debootstrap \
	squashfs-tools \
	genisoimage \
	syslinux-utils 

# Create a base Debian system using debootstrap
RUN debootstrap --arch=amd64 bookworm /chroot-directory http://deb.debian.org/debian/

# Execute additional customizations inside the chroot environment
# The example below installs some packages, but you can add any custom commands
RUN chroot /chroot-directory apt install -y \
    htop 

# Optionally, package the customized system into an ISO or other format (depends on your needs)
# You can also add scripts or files from your build context
# COPY some-script.sh /chroot-directory/path/
# RUN chroot /chroot-directory /path/some-script.sh

# Final packaging steps, etc.
# ...

