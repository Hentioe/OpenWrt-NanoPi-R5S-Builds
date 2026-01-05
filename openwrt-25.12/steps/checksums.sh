#!/usr/bin/env bash
set -e

ROOTDIR=$(pwd)
ARTIFACTS_DIR="$ROOTDIR/build/openwrt/bin/targets/rockchip/armv8"

cat "$ARTIFACTS_DIR"/sha256sums
