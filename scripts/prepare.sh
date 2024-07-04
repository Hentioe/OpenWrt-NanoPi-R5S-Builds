#!/usr/bin/env bash
# 此脚本不支持重复执行，需清理后再执行。
set -e

export OPENWRT_BRANCH=23.05

# 开始执行完整的构建步骤
./openwrt-${OPENWRT_BRANCH}/steps/01_clone_openwrt.sh
./openwrt-${OPENWRT_BRANCH}/steps/02_patch_openwrt.sh
./openwrt-${OPENWRT_BRANCH}/steps/03-prepare_package.sh
./openwrt-${OPENWRT_BRANCH}/steps/04-create_config_from_seed.sh full
# 下载源码包
(cd build/openwrt && make download -j10 || {
    make download -j1 V=s
    exit 1
})
bash ./openwrt-${OPENWRT_BRANCH}/steps/05-all_kmods.sh
