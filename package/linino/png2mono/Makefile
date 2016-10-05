#
# Copyright (C) Dog Hunter AG 2014
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=png2mono
PKG_VERSION:=1.0.0
PKG_RELEASE:=8

include $(INCLUDE_DIR)/uclibc++.mk
include $(INCLUDE_DIR)/package.mk

define Package/png2mono
	DEPENDS:=+libpng +libstdcpp +libc +libpthread
	SECTION:=multimedia
	CATEGORY:=Multimedia
	TITLE:=Converts a png grayscale image to Black/white image
	URL:=http://www.aureliocolosimo.it
endef

define Package/png2mono/description
	Converts a png grayscale image to Black/White image
endef

define Build/Prepare
	cp src/png2mono.c $(PKG_BUILD_DIR)
endef

define Build/Compile
	$(TARGET_CC) $(PKG_BUILD_DIR)/png2mono.c -lpng -o $(PKG_BUILD_DIR)/png2mono
endef

define Package/png2mono/install
	$(INSTALL_DIR) $(1)/usr/bin/
	
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/png2mono $(1)/usr/bin/
endef

$(eval $(call BuildPackage,png2mono))
