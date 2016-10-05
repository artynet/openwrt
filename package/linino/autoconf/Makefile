
# Copyright (C) 2008-2012 OpenWrt.org
#
# This is free software, licenautoconf under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=autoconf
PKG_VERSION:=2.69
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@GNU/autoconf
# PKG_MD5SUM:=b7e35aa175778c84942b1fee4144988b

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/autoconf
  SECTION:=devel
  CATEGORY:=Development
  DEPENDS:=+bash +perl +libc +libstdcpp +make
  TITLE:=autoconf
  URL:=http://www.gnu.org/software/autoconf/
endef

define Package/autoconf/description
	The GNU autoconf utility
endef

define Package/autoconf/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
endef

$(eval $(call BuildPackage,autoconf))
