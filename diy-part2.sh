#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.0.1/g' package/base-files/files/bin/config_generate

#Try to fix this: https://github.com/coolsnowwolf/lede/issues/9065
sed -i 's/mac_addr = of_get_mac_address(rt2x00dev->dev->of_node)/mac_addr = of_get_mac_address(rt2x00dev->dev->of_node, eeprom_mac_addr)/' /workdir/openwrt/build_dir/target-x86_64_musl/linux-x86_64/backports-5.10.42-1/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c

