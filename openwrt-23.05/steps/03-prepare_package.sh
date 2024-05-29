#!/usr/bin/env bash
set -e

ROOTDIR=$(pwd)
OPENWRT_BRANCH=23.05

cd "$ROOTDIR/build/openwrt"

# Update feeds
./scripts/feeds update -a

# Add simple-obfs
echo "Adding simple-obfs ..."
rm -rf package/network/simple-obfs
cp -r $ROOTDIR/openwrt-$OPENWRT_BRANCH/patches/package/simple-obfs package/network/simple-obfs

# replace libpfring that fails compiling
echo "Replacing libpfring ..."
rm -rf feeds/packages/libs/libpfring
cp -R $ROOTDIR/openwrt-$OPENWRT_BRANCH/patches/package/libpfring feeds/packages/libs/

# install feeds
./scripts/feeds update -i && ./scripts/feeds install -a

COMMENT="full"
# Time stamp with $(date +%Y.%m.%d)
BUILD_DATE="$(date +%Y.%m.%d)"
BANNER_EXTRA=$($ROOTDIR/tools/render_tpl $ROOTDIR/openwrt-$OPENWRT_BRANCH/banner_extra -v build_date=$BUILD_DATE)
echo "Write build date in openwrt : $BUILD_DATE"
echo -e "\n$BANNER_EXTRA ($COMMENT)\n" >>package/base-files/files/etc/banner
sed -i '/DISTRIB_DESCRIPTION/d' package/base-files/files/etc/openwrt_release
echo "DISTRIB_DESCRIPTION='$BANNER_EXTRA'" >>package/base-files/files/etc/openwrt_release

rm -rf .config
