#
# Copyright (C) 2008-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=avrdude63
PKG_VERSION:=6.3
PKG_RELEASE:=1

PKG_SOURCE:=avrdude-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://download.savannah.gnu.org/releases/avrdude
# PKG_MD5SUM:=9db8c25b935d34234b9b1ba16ad55fd5

PKG_MAINTAINER:=Ted Hess <thess@kitschensync.net>
PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=COPYING

PKG_BUILD_DIR:=$(BUILD_DIR)/avrdude-6.3

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/avrdude63
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=AVR Downloader/UploaDEr
  URL:=http://www.nongnu.org/avrdude/
  DEPENDS:=+libncurses +libreadline +libusb-compat +libftdi1 +libelf1
endef

define Package/avrdude63/description
 AVRDUDE is a full featured program for programming Atmel's AVR CPU's.
endef

CONFIGURE_ARGS+= \
	--disable-doc \
	--disable-parport \
	--enable-linuxgpio \

define Package/avrdude63/conffiles
/etc/avrdude.conf
endef

define Package/avrdude63/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) $(PKG_INSTALL_DIR)/etc/avrdude.conf $(1)/etc/
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/avrdude $(1)/usr/bin/
endef

$(eval $(call BuildPackage,avrdude63))
