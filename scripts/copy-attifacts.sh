#!/usr/bin/env bash
set -e

# 读取第一个参数（分支名）
OPENWRT_BRANCH=$1
# 读取第二个参数（seed 名）
SEED_NAME=$2
# 读取第三个参数（目标目录）
TARGET_DIR=$3

ROOT_PATH=$(pwd)

$ROOT_PATH/openwrt-${OPENWRT_BRANCH}/steps/copy-attifacts.sh ${SEED_NAME} ${TARGET_DIR}
