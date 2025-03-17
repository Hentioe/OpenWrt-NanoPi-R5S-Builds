#!/usr/bin/env bash
set -e

SOURCE_DIR=$1
TARGET_DIR=$2

mv -f "$SOURCE_DIR/openwrt-*-rockchip-armv8-friendlyarm_nanopi-r5s-*-sysupgrade.img.gz" $TARGET_DIR 2>/dev/null
true
