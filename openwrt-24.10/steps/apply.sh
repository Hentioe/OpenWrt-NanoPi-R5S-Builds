#!/usr/bin/env bash
set -e

ROOTDIR=$(pwd)
OPENWRT_BRANCH=openwrt-24.10
SEED_FILE="$1.seed"

cd "$ROOTDIR/build/openwrt"

# 复制 menuconfig 配置
cp "$ROOTDIR/$OPENWRT_BRANCH/seeds/$SEED_FILE" .config

# 应用 menuconfig 修改
make defconfig
