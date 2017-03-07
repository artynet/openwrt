#
# Copyright (C) 2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=esptool-ck
PKG_VERSION:=0.4.9
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/igrr/esptool-ck.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=0.4.9
PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz

PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/esptool-ck
	SECTION:=utils
	CATEGORY:=Utilities
	DEPENDS:=+libc +librt
	TITLE:=ESP8266/ESP32 build helper
	URL:=https://github.com/igrr/esptool-ck.git
endef

define Package/esptool-ck/description
	The ESP8266/ESP32 build helper tool by Christian Klippel
endef

define Package/esptool-ck/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/esptool $(1)/usr/bin
endef

$(eval $(call BuildPackage,esptool-ck))
