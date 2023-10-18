#!/usr/bin/env bash
# 此脚本用于本地构建测试。执行前会进行清理，不会保留上次构建的结果。
export OPENWRT_BRANCH=23.05

# 清理构建目录
rm -rfi ./build

# 开始执行完整的构建步骤
./openwrt-${OPENWRT_BRANCH}/steps/01_clone_openwrt.sh
./openwrt-${OPENWRT_BRANCH}/steps/02_prepare_openwrt_folder.sh
./openwrt-${OPENWRT_BRANCH}/steps/03_patch_openwrt.sh
./openwrt-${OPENWRT_BRANCH}/steps/04-prepare_package.sh
./openwrt-${OPENWRT_BRANCH}/steps/06-create_config_from_seed.sh full
# 下载源码包
(cd build/openwrt && make download -j10 || {
    make download -j1 V=s
    exit 1
})
bash ./openwrt-${OPENWRT_BRANCH}/steps/07-all_kmods.sh
# 构建固件
(cd build/openwrt && make -j$(nproc) || {
    make -j1 V=s
    exit 1
})
