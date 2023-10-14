#!/bin/bash

# Variables
CHROOT_DIR_HOST="/data/chroot"
CHROOT_DIR_CONTAINER="/chroot"
DOCKERFILE_PATH="/data/image-builder/Build.Dockerfile"
IMAGE_NAME="custom-debian-installer"

# Prepare chroot on host
/data/image-builder/prepare-chroot.sh

# Build image using podman with volume mapping
podman build -t $IMAGE_NAME -v $CHROOT_DIR_HOST:$CHROOT_DIR_CONTAINER -f $DOCKERFILE_PATH /data/image-builder/
