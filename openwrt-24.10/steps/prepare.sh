#!/usr/bin/env bash
set -e

ROOTDIR=$(pwd)
OPENWRT_BRANCH=openwrt-24.10
COMMENT=$1

cd "$ROOTDIR/build/openwrt"

# 更新/安装 feeds
./scripts/feeds update -a && ./scripts/feeds install -a

# 移除 openwrt feeds 自带的部分包
rm -rf feeds/packages/net/{xray-core,v2ray-core,v2ray-geodata,sing-box}
# 添加自定义 feeds 包取代
git clone --depth=1 https://github.com/sbwml/openwrt_helloworld package/helloworld

# Timestamp with $(date +%Y.%m.%d)
BUILD_DATE="$(date +%Y.%m.%d)"
BANNER_EXTRA="Built by Hentioe on $BUILD_DATE"
echo "Write the build date in the banner: $BUILD_DATE"
echo -e "\n$BANNER_EXTRA ($COMMENT)\n" >>package/base-files/files/etc/banner

rm -rf .config
