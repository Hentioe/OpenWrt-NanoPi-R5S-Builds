#!/usr/bin/env bash
set -e

# 读取第一个参数（分支名）
OPENWRT_BRANCH=$1
# 读取第二个参数（seed 名）
SEED_NAME=$2

# 检查两个参数是否传递
if [ -z "$OPENWRT_BRANCH" ] || [ -z "$SEED_NAME" ]; then
  echo "Usage: $0 <openwrt-branch> <seed-name>"
  exit 1
fi

ROOT_PATH=$(pwd)

# 执行通用步骤
$ROOT_PATH/openwrt-${OPENWRT_BRANCH}/steps/clone.sh
$ROOT_PATH/openwrt-${OPENWRT_BRANCH}/steps/prepare.sh ${SEED_NAME}
$ROOT_PATH/openwrt-${OPENWRT_BRANCH}/steps/apply.sh ${SEED_NAME}

# 开始构建
(cd $ROOT_PATH/build/openwrt && make -j$(nproc) || {
  make -j1 V=s
})
