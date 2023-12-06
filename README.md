# OpenWrt Builds for NanoPi R5S

[![Build Status](https://ci.hentioe.dev/api/badges/Hentioe/OpenWrt-NanoPi-R5S-Builds/status.svg)](https://ci.hentioe.dev/Hentioe/OpenWrt-NanoPi-R5S-Builds)
[![Version](https://img.shields.io/badge/version-23.05-skyblue)](https://github.com/openwrt/openwrt/tree/openwrt-23.05)
[![Firmware Download](https://img.shields.io/badge/download-firmware-pink)](https://op.hentioe.dev/dist/)

构建适用于 NanoPi R5S 的原版 OpenWrt。

## 说明

本项目是补丁、构建脚本、CI 配置的集合。基于 [anaelorlinski/OpenWrt-NanoPi-R5S-Builds](https://github.com/anaelorlinski/OpenWrt-NanoPi-R5S-Builds) 仓库，但已存在较大差异。

和 NanoPi 官方提供的 FriendlyWrt 不同，本项目的目标是构建原汁原味的 OpenWrt，足够通用或精简。

## 鸣谢

感谢 Anael Orlinski（后简称 AO）的工作让我节省了诸多时间精力！

- [AO 的赞助链接](https://www.paypal.com/donate/?business=8XQTGXAHEAKPY&no_recurring=0&currency_code=EUR)

## 和 AO 构建的差异

- 本项目的构建过程和固件下载都托管于自己的服务器，非手动也非 GitHub Actions。
- 本项目始终拉取固定分支的最新代码执行构建，不固定在某个提交。服务器每周构建一次，这是[下载页面](https://op.hentioe.dev/dist/)。
- 删除了一些非必要补丁和软件包（如 AO 个人所需的软件包）。
- 添加了中文支持，所有 LuCI app 都有中文。
- 添加了大量软件包及相关配置。如容器化技术 LXC/Docker，文件共享 NFSv4/Samba4（仅服务端），UASP 支持（挂载硬盘盒所需），还有一些 AO 漏掉的必要基础包。
- 有其它值得说明的再继续补充。

## 关联文章

参考这些文章，可以理解本项目为何会定制某些内容，也可以让 R5S 发挥更大的作用。

- [知乎回答：OpenWrt 能做哪些有趣的事？](https://www.zhihu.com/question/568604090/answer/3251350523)

## 结束语

有其它问题可创建 issue 跟我交流。
