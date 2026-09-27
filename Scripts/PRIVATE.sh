#!/bin/bash
# SPDX-License-Identifier: MIT
# Private extension: switch package repository to a China mirror (USTC).
# Sourced by Scripts/Packages.sh while cwd is ./wrt (the OpenWrt source tree).

MIRROR="https://mirrors.ustc.edu.cn/immortalwrt"

# Fallback: point the built-in default repo at the China mirror even if
# CONFIG_VERSION_REPO is not honoured. base-files/Makefile uses VERSION_REPO
# (derived from this) to generate /etc/apk/repositories.d/distfeeds.list
# and /etc/opkg/distfeeds.conf inside the firmware.
if [ -f include/version.mk ]; then
	sed -i "s|https://downloads.immortalwrt.org/snapshots|${MIRROR}/snapshots|g" include/version.mk
	echo "[PRIVATE] software repo default -> ${MIRROR}/snapshots"
fi
