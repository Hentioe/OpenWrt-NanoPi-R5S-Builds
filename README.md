# OpenWrt Builds for NanoPi R5S

[![status-badge](https://x86-ci.hentioe.dev/api/badges/1/status.svg)](https://x86-ci.hentioe.dev/repos/1)
[![Version](https://img.shields.io/badge/version-24.10-skyblue)](https://github.com/openwrt/openwrt/tree/openwrt-24.10)
[![Firmware Download](https://img.shields.io/badge/download-firmware-pink)](https://openwrt.hentioe.dev/dist/)

构建适用于 NanoPi R5S 的原版 OpenWrt。

## 说明

和 NanoPi 官方提供的 FriendlyWrt 不同，本项目的目标是制作足够精简通用且时刻保持最新的原版 OpenWrt。

_本项目是补丁、构建脚本、CI 配置的集合。_

## 发布

- 本项目始终拉取特定分支的最新代码执行构建，不固定于某个提交。
- 本项目的构建和固件下载皆托管于自己的服务器。服务器**每周**构建一次，这是[下载页面](https://openwrt.hentioe.dev/dist/)。

## 定制

- 基础环境：LuCI 基础包、中文语言、Material 主题、外部挂载支持等。
- 容器化支持
  - LXC
  - Docker
- 存储/共享
  - NFSv4
  - Samba4（仅服务端）
  - UASP 支持（挂载硬盘盒需要）
  - 文件系统支持：exfat、ext4、btrfs、ntfs、f2fs
- 统计支持
  - collectd 及大量插件
  - vnstat2
- 实用工具
  - frp
  - DDNS
- 实用控制功能
  - SQM 队列
  - QoS
- 网络优化
  - TCP BBR
- 有其它有用工具集

## 关联文章

参考这些文章，可以理解本项目为何会定制某些内容。也可以让 R5S 发挥更大的作用。

- [OpenWrt 入门：构建自己的镜像（NanoPi R5S 为例）](https://blog.hentioe.dev/posts/openwrt-getting-started-build-your-own-image.html)
- [知乎回答：OpenWrt 能做哪些有趣的事？](https://www.zhihu.com/question/568604090/answer/3251350523)

## 结束语

有其它问题可创建 issue 跟我交流。
