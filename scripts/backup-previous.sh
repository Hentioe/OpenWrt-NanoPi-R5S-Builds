#!/usr/bin/env bash
set -e

# 读取第一个参数（分支名）
OPENWRT_BRANCH=$1
# 读取第二个参数（原目录）
SOURCE_DIR=$2
# 读取第三个参数（目标目录）
TARGET_DIR=$3

# 移除 SOURCE_DIR 尾部可能存在的 `/`
SOURCE_DIR=${SOURCE_DIR%/}

ROOT_PATH=$(pwd)

$ROOT_PATH/openwrt-${OPENWRT_BRANCH}/steps/backup-previous.sh ${SOURCE_DIR} ${TARGET_DIR}
