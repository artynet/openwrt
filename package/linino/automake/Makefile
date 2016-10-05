
# Copyright (C) 2008-2012 OpenWrt.org
#
# This is free software, licenautomake under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=automake
PKG_VERSION:=1.15
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@GNU/automake
# PKG_MD5SUM:=b7e35aa175778c84942b1fee4144988b

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/automake
  SECTION:=devel
  CATEGORY:=Development
  DEPENDS:=+bash +perl +libc +libstdcpp
  TITLE:=automake
  URL:=http://www.gnu.org/software/automake/
endef

define Package/automake/description
	The GNU automake utility
endef

define Build/configure
	$(PKG_BUILD_DIR)/bootstrap
	$(PKG_BUILD_DIR)/configure
endef

#CONFIGURE_VARS += \
#	ac_cv_func_mempcpy=n \
#	gl_cv_func_wcwidth_works=yes \
#    ac_cv_func_fnmatch_gnu=yes \

define Package/automake/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
endef

$(eval $(call BuildPackage,automake))
