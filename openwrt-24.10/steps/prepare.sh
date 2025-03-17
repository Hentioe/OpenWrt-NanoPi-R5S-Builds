#!/usr/bin/env bash
set -e

ROOTDIR=$(pwd)
OPENWRT_BRANCH=openwrt-24.10

cd "$ROOTDIR/build/openwrt"

# 更新 feeds
./scripts/feeds update -a

# 移除 openwrt feeds 自带的部分包
rm -rf feeds/packages/net/{xray-core,v2ray-core,v2ray-geodata,sing-box}
# 添加自定义 feeds 包取代
git clone https://github.com/sbwml/openwrt_helloworld package/helloworld

# 安装 feeds
./scripts/feeds update -i && ./scripts/feeds install -a

COMMENT=$1
# Time stamp with $(date +%Y.%m.%d)
BUILD_DATE="$(date +%Y.%m.%d)"
BANNER_EXTRA="Built by Hentioe on $BUILD_DATE"
echo "Write build date in openwrt : $BUILD_DATE"
echo -e "\n$BANNER_EXTRA ($COMMENT)\n" >>package/base-files/files/etc/banner
sed -i '/DISTRIB_DESCRIPTION/d' package/base-files/files/etc/openwrt_release
echo "DISTRIB_DESCRIPTION='$BANNER_EXTRA'" >>package/base-files/files/etc/openwrt_release

rm -rf .config
