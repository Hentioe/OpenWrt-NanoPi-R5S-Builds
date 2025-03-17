#!/usr/bin/env bash
set -e

# 读取第一个参数（分支名）
OPENWRT_BRANCH=$1
# 读取第二个参数（seed 名）
SEED_NAME=$2

# 执行通用步骤
./openwrt-${OPENWRT_BRANCH}/steps/clone.sh
./openwrt-${OPENWRT_BRANCH}/steps/prepare.sh ${SEED_NAME}
./openwrt-${OPENWRT_BRANCH}/steps/apply.sh ${SEED_NAME}

# 开始构建
(cd build/openwrt && make -j$(nproc) || {
  make -j1 V=s
})
