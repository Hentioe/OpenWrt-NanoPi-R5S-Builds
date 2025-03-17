#!/usr/bin/env bash
set -e

ROOTDIR=$(pwd)
ARTIFACTS_DIR="$ROOTDIR/build/openwrt/bin/targets/rockchip/armv8"
TARGET_DIR=$2

cp "$ARTIFACTS_DIR"/openwrt-*-rockchip-armv8-friendlyarm_nanopi-r5s-*-sysupgrade.img.gz "$TARGET_DIR"
