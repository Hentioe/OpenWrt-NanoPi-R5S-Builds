#!/usr/bin/env bash
set -e

ROOTDIR=$(pwd)
OPENWRT_BRANCH=openwrt-24.10

# 创建构建目录
echo "Creating build directory..."
cd $ROOTDIR
mkdir build
cd build

# 克隆 OpenWrt 仓库
git clone -b $OPENWRT_BRANCH --depth=1 https://git.openwrt.org/openwrt/openwrt.git openwrt

# 输出最新的提交信息
echo "Latest $OPENWRT_BRANCH commit:"
(cd openwrt && git log -1)
