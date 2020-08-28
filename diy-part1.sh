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

#取消掉feeds.conf.default文件里面的helloworld的#注释
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default  #使用源码自带ShadowSocksR Plus+出国软件

# Add a feed source
sed -i '$a src-git diy1 https://github.com/xiaorouji/openwrt-package.git;master' feeds.conf.default


#添加自定义插件链接（自己想要什么就github里面搜索然后添加）
#清理插件
#rm -rf package/adguardhome
#rm -rf package/luci-app-adguardhome
#rm -rf package/luci-theme-atmaterial
#rm -rf package/luci-app-openclash
#添加
git clone -b master https://github.com/vernesong/OpenClash.git package/luci-app-openclash  #openclash出国软件
svn co https://github.com/Lienol/openwrt/trunk/package/diy/adguardhome package/adguardhome  #adguardhome广告过滤
svn co https://github.com/Lienol/openwrt/trunk/package/diy/luci-app-adguardhome package/luci-app-adguardhome  #adguardhome广告过滤
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/luci-theme-atmaterial package/luci-theme-atmaterial #atmaterial主题
git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns  #smartdns

