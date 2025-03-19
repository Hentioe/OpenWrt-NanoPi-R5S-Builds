#!/usr/bin/env bash
set -e

OPENWRT_BRANCH=$1
SEED_NAME=$2

incus file pull \
  generic-openwrt-build/home/ubuntu/OpenWrt-NanoPi-R5S-Builds/build/openwrt/diffconfig \
  openwrt-$OPENWRT_BRANCH/seeds/$SEED_NAME.seed
