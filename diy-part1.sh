#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i '1i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default

#rm -rf feeds/packages/net/{xray-core,v2ray-core,v2ray-geodata,sing-box}

sed -i '1i src-git kenzo https://github.com/kevinCSDN/openwrt-packages_2025' feeds.conf.default
#sed -i '1i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '2i src-git small https://github.com/kevinCSDN/small_2024' feeds.conf.default

#注释掉新版luci
#sed -i 's|^#src-git luci https://github.com/coolsnowwolf/luci$|src-git luci https://github.com/coolsnowwolf/luci|' feeds.conf.default
#sed -i 's|^src-git luci https://github.com/coolsnowwolf/luci.git;openwrt-23.05$|#src-git luci https://github.com/coolsnowwolf/luci.git;openwrt-23.05|' feeds.conf.default


./scripts/feeds update -a && rm -rf feeds/luci/applications/luci-app-mosdns && rm -rf feeds/packages/net/{alist,adguardhome,mosdns,smartdns}
rm -rf feeds/packages/lang/golang
#git clone https://github.com/kenzok8/golang feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang -b 1.23 feeds/packages/lang/golang
git clone https://github.com/vernesong/OpenClash package/openclash

#克隆passwall环境插件
#git clone https://github.com/xiaorouji/openwrt-passwall-packages package/helloworld
#git clone --depth=1 -b 18.06 https://github.com/kiddin9/luci-theme-edge package/luci-theme-edge
#git clone --depth=1 https://github.com/derisamedia/luci-theme-alpha package/luci-theme-alpha
#克隆的源码放在small文件夹,预先建立small文件夹
#mkdir package/small
#pushd package/small

#克隆源码
#删除feeds自带mosdns、v2ray-geodata
#rm -rf ./feeds/packages/net/mosdns
#rm -rf feeds/packages/net/v2ray-geodata
rm -rf feeds/luci/themes/luci-theme-argon
#rm -rf feeds/luci/themes/luci-theme-bootstrap
rm -rf feeds/luci/themes/luci-app-argon-config

#passwall2
#git clone -b main --depth 1 https://github.com/xiaorouji/openwrt-passwall2.git
#git clone -b luci-smartdns-dev --depth 1 https://github.com/xiaorouji/openwrt-passwall.git
#git clone -b main --depth 1 https://github.com/bcseputetto/openwrt-passwall.git
#https://github.com/bcseputetto/openwrt-passwall
#mosdns
#git clone -b v5 --depth 1 https://github.com/sbwml/luci-app-mosdns.git
#git clone --depth=1 https://github.com/fw876/helloworld.git
#git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
#git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config
#popd
