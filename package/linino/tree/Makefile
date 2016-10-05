
# Copyright (C) 2008-2012 OpenWrt.org
#
# This is free software, licentree under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=tree
PKG_VERSION:=1.7.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://mama.indstate.edu/users/ice/tree/src/
# PKG_MD5SUM:=b7e35aa175778c84942b1fee4144988b

# PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/tree
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libc +libstdcpp
  TITLE:=The tree Command for Linux
  URL:=http://mama.indstate.edu/users/ice/tree/
endef

define Package/tree/description
	Tree is a recursive directory listing command that produces a depth indented listing of files, which is colorized ala dircolors if the LS_COLORS environment variable is set and output is to tty
endef

define Build/configure
	# NOOP
endef

TARGET_CFLAGS += '-Wno-error -fhonour-copts'

define Package/tree/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tree $(1)/usr/bin/
endef

$(eval $(call BuildPackage,tree))
