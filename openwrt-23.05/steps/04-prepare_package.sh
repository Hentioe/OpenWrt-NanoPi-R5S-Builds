#!/bin/bash
ROOTDIR=$(pwd)
echo $ROOTDIR
if [ ! -e "$ROOTDIR/build" ]; then
    echo "Please run from root / no build dir"
    exit 1
fi

OPENWRT_BRANCH=23.05

cd "$ROOTDIR/build"

# install feeds
cd openwrt
./scripts/feeds update -a && ./scripts/feeds install -a

COMMENT="based on Anael Orlinski's scripts"
# Time stamp with $(date +%Y.%m.%d)
BUILD_DATE="$(date +%Y.%m.%d)"
echo "Write build date in openwrt : $BUILD_DATE"
echo -e '\nBuilt by Hentioe on '${BUILD_DATE} \(${COMMENT}\)'\n' >>package/base-files/files/etc/banner
sed -i '/DISTRIB_DESCRIPTION/d' package/base-files/files/etc/openwrt_release
echo "DISTRIB_DESCRIPTION='Built by Hentioe on ${BUILD_DATE}'" >>package/base-files/files/etc/openwrt_release

rm -rf .config
