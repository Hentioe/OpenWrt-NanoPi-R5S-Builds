#!/usr/bin/env bash

ROOTDIR=$(pwd)
echo $ROOTDIR
if [ ! -e "$ROOTDIR/build" ]; then
    echo "Please run from root / no build dir"
    exit 1
fi

cd "$ROOTDIR/build"

cd openwrt
cp $ROOTDIR/openwrt-23.05/seed/R5S-$1.seed .config

make defconfig
