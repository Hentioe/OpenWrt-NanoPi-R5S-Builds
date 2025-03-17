#!/usr/bin/env bash

ROOT_PATH=$(pwd)

# 删除构建目录中……
echo "Deleting build directory..."

rm -rf $ROOT_PATH/build

# 清理完成
echo "Cleaned up."
