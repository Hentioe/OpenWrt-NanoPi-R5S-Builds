#!/usr/bin/env bash
set -e

ROOTDIR=$(pwd)

cd "$ROOTDIR/build"

cd openwrt
cp $ROOTDIR/openwrt-23.05/seed/R5S-$1.seed .config

make defconfig
