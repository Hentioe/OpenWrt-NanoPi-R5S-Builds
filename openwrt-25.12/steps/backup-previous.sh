#!/usr/bin/env bash
set -e

SOURCE_DIR=$1
TARGET_DIR=$2

FILE_PATTERN="openwrt-*-rockchip-armv8-friendlyarm_nanopi-r5s-*-sysupgrade.img.gz"

if ls $SOURCE_DIR/$FILE_PATTERN >/dev/null 2>&1; then
  mv $SOURCE_DIR/$FILE_PATTERN $TARGET_DIR

  echo "Backup previous firmwares to $TARGET_DIR"
else
  echo "No previous firmwares found, skip backup"
fi
