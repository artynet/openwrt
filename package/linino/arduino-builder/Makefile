#
# Copyright (C) 2016 Arduino Srl
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=arduino-builder
PKG_VERSION:=1.3.25
PKG_RELEASE:=2

PKG_SOURCE_URL:=http://download.linino.org/src/
PKG_SOURCE:=arduino-builder-$(PKG_VERSION)-linux_mips.tar.bz2
PKG_MD5SUM:=44e571707079f52e823e19aad92f32e0

include $(INCLUDE_DIR)/package.mk

define Package/arduino-builder
	SECTION:=devel
	CATEGORY:=Development
	TITLE:=Arduino Builder tool
	DEPENDS:=+libc +libstdcpp
endef

define Package/arduino-builder/description
	The Arduino builder engine written in GoLang
endef

define Build/Prepare
	$(TAR) xvf $(DL_DIR)/$(PKG_SOURCE) -C $(PKG_BUILD_DIR)
endef

define Build/Configure
	# NOOP
endef

define Build/Compile
	# NOOP
endef

define Package/arduino-builder/install
	$(INSTALL_DIR) $(1)/usr/bin

	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/arduino-builder $(1)/usr/bin
endef

$(eval $(call BuildPackage,arduino-builder))
