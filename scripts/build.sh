#!/usr/bin/env bash
set -e

(cd build/openwrt && make -j$(nproc) || {
    make -j1 V=s
    exit 1
})
