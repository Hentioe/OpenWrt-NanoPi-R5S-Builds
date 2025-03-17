#!/usr/bin/env bash
set -e

ROOTDIR=$(pwd)
OPENWRT_BRANCH=openwrt-24.10

cd "$ROOTDIR/build/openwrt"

# 复制 menuconfig 配置
cp $ROOTDIR/openwrt-$OPENWRT_BRANCH/seeds/$1.seed .config

# 应用 menuconfig 修改
make defconfig
