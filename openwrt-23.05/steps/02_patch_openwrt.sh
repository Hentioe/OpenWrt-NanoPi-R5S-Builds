#!/usr/bin/env bash
set -e

ROOTDIR=$(pwd)
BUILDDIR="$ROOTDIR/build"
OPENWRT_BRANCH=23.05

cd "$BUILDDIR/openwrt"

# -------------- UBOOT -----------------------------------
# replace uboot with local uboot package
# this version does not need arm-trusted-firmware-rk3328
rm -rf package/boot/uboot-rockchip
cp -R $ROOTDIR/openwrt-$OPENWRT_BRANCH/patches/package/uboot-rockchip package/boot/

# -------------- ARM TRUSTED FIRMWARE -------------------
# replace uboot with local uboot package
# this version does not need arm-trusted-firmware-rk3328
rm -rf package/boot/arm-trusted-firmware-rockchip
cp -R $ROOTDIR/openwrt-$OPENWRT_BRANCH/patches/package/arm-trusted-firmware-rockchip package/boot/

# -------------- target linux/rockchip ----------------
rm -rf target/linux/rockchip
cp -R $ROOTDIR/openwrt-$OPENWRT_BRANCH/patches/target/linux/rockchip target/linux/

# replace target rockchip with original one
#cp -R $BUILDDIR/openwrt-fresh-$OPENWRT_BRANCH/target/linux/rockchip target/linux/
# override manually some files in the rockchip target using rsync to merge folders and override same filenames
#rsync -avz $ROOTDIR/openwrt-$OPENWRT_BRANCH/patches/target/ target

# ------------------ packages ------------------------------------

# video modules
rm -rf package/kernel/linux/modules/video.mk
cp $ROOTDIR/openwrt-$OPENWRT_BRANCH/patches/package/kernel/linux/modules/video.mk package/kernel/linux/modules/

# add caiaq usb sound module for shairport with old soundcard
ADDON_PATH='snd-usb-caiaq.makefileaddon'
ADDON_DEST='package/kernel/linux/modules/usb.mk'
if ! grep -q " --- $ADDON_PATH" $ADDON_DEST; then
   echo "Adding $ADDON_PATH to $ADDON_DEST"
   echo "# --- $ADDON_PATH" >>$ADDON_DEST
   cat $ROOTDIR/openwrt-$OPENWRT_BRANCH/patches/$ADDON_PATH >>$ADDON_DEST
else
   echo "Already added $ADDON_PATH to $ADDON_DEST"
fi

cat <<"EOF" >>target/linux/generic/config-5.15
# CONFIG_IR_ENE is not set
# CONFIG_IR_FINTEK is not set
# CONFIG_IR_GPIO_TX is not set
# CONFIG_IR_IMON_DECODER is not set
# CONFIG_IR_ITE_CIR is not set
# CONFIG_IR_MCE_KBD_DECODER is not set
# CONFIG_IR_NUVOTON is not set
# CONFIG_IR_PWM_TX is not set
# CONFIG_IR_RCMM_DECODER is not set
# CONFIG_IR_SANYO_DECODER is not set
# CONFIG_IR_SHARP_DECODER is not set
# CONFIG_IR_SPI is not set
# CONFIG_IR_WINBOND_CIR is not set
# CONFIG_IR_XMP_DECODER is not set
# CONFIG_MEDIA_CEC_RC is not set
# CONFIG_MTD_SBC_GXX is not set
EOF

#cleanup
if [ -e .config ]; then
   echo "Cleaning up ..."
   make target/linux/clean
   make package/boot/uboot-rockchip/clean
   make package/boot/arm-trusted-firmware-rockchip/clean
   make package/kernel/r8125/clean
fi
