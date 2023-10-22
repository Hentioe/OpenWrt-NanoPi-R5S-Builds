#!/usr/bin/env bash
# 此脚本用于本地构建测试。运行前建议执行 clean-full.sh 进行完整清理，因为当前的构建步骤脚本无法保证多次执行后的正确性。
export OPENWRT_BRANCH=23.05

# 开始执行完整的构建步骤
./openwrt-${OPENWRT_BRANCH}/steps/01_clone_openwrt.sh
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
