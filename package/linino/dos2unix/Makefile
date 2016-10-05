
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# Initial port of dos2unix to OpenWrt - Jan Jaeger 25-MAR-2010

include $(TOPDIR)/rules.mk

PKG_NAME:=dos2unix
PKG_VERSION:=7.3.3
PKG_RELEASE:=1
PKG_MD5SUM:=e06d7b8bf4b9b86d7ff61f02d514e95f

PKG_SOURCE_URL:=@SF/dos2unix
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz

PKG_BUILD_DEPENDS:=+libintl

include $(INCLUDE_DIR)/uclibc++.mk
include $(INCLUDE_DIR)/package.mk

define Package/dos2unix
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Dos2Unix / Unix2Dos
  DEPENDS:=+libc +libstdcpp +libintl
  URL:=http://dos2unix.sourceforge.net/
endef

define Package/dos2unix/description
	Dos2Unix / Unix2Dos - Text file format converters
endef

define Build/Configure
	# NOOP
endef

TARGET_CFLAGS += -I$(STAGING_DIR)/usr/lib/libintl-stub/include

define Package/dos2unix/install
	$(INSTALL_DIR) $(1)/usr/bin

	$(INSTALL_BIN) $(PKG_BUILD_DIR)/dos2unix $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/unix2dos $(1)/usr/bin/
endef

$(eval $(call BuildPackage,dos2unix))
