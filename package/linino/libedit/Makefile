#
# Copyright (C) 2016 CZ.NIC, z.s.p.o. <knot-dns@labs.nic.cz>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libedit
PKG_VERSION:=20160903-3.1
PKG_RELEASE:=1

PKG_MAINTAINER:=Daniel Salzman <daniel.salzman@nic.cz>
PKG_LICENSE:=BSD-3-Clause

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://thrysoee.dk/editline/
# PKG_MD5SUM:=b6e60f326a3fce91bea1a6fe4700af58

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libedit
	SECTION:=libs
	CATEGORY:=Libraries
	TITLE:=BSD editline and history library
	URL:=http://thrysoee.dk/editline/
	DEPENDS:=+libncurses
endef

define Package/libedit/description
	Generic line editing, history, and tokenization functions similar to GNU Readline.
endef

define Build/InstallDev
	$(INSTALL_DIR)						$(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/*.h		$(1)/usr/include/

	$(INSTALL_DIR)						$(1)/usr/include/editline
	$(CP) $(PKG_INSTALL_DIR)/usr/include/editline/*.h	$(1)/usr/include/editline/
	
	$(INSTALL_DIR)						$(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libedit.{a,so*}	$(1)/usr/lib/
endef

define Package/libedit/install
	$(INSTALL_DIR)					$(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libedit.so.*	$(1)/usr/lib/
endef

$(eval $(call BuildPackage,libedit))
