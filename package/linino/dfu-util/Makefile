#
# Copyright (C) 2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=dfu-util
PKG_VERSION:=0.9
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git

PKG_REVISION:=v0.9
PKG_SOURCE_VERSION=$(PKG_REVISION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_URL:=git://git.code.sf.net/p/dfu-util/dfu-util
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz

PKG_FIXUP:=libtool autoreconf

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/dfu-util
  TITLE:=dfu-util Tool
  SECTION:=utils
  DEFAULT:=m
  CATEGORY:=Utilities
  DEPENDS:=+libpthread +libc +libstdcpp +libusb-1.0
  URL:=https://gitorious.org/dfu-util
endef

define Package/dfu-util/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
endef

$(eval $(call BuildPackage,dfu-util))
