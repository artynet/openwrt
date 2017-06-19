#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-sdk-auth
PKG_VERSION:=0.1.5
PKG_RELEASE:=2
PKG_MAINTAINER:=Micke Prag <micke.prag@telldus.se>
PKG_LICENSE:=Python-2.0

PKG_SOURCE:=python_sdk_auth-$(PKG_VERSION)-py2-none-any.tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/2d/7d/9b519ee855e870d1b338dd567983623904e7c754a1f36e70890a5c9d7636/

PKG_MD5SUM:=f5f2ea719fc67fb516bc3994d1812639

PKG_BUILD_DIR:=$(BUILD_DIR)/python_sdk_auth-$(PKG_VERSION)-py2-none-any
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk

define Package/python-sdk-auth
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=sdk auth for hologram
  DEFAULT:=m
  URL:=https://pypi.python.org/pypi/hjson
  DEPENDS:=+python +python-hologram
endef

define Package/python-sdk-auth/description
	Library for Hologram Authentication methods
endef

define Build/Compile
	# NOOP
endef

define Package/python-sdk-auth/install
	$(INSTALL_DIR) $(1)/usr/lib/python2.7/site-packages
	$(CP) -R $(PKG_BUILD_DIR)/HologramAuth $(1)/usr/lib/python2.7/site-packages
	$(CP) -R $(PKG_BUILD_DIR)/python_sdk_auth-0.1.5.dist-info $(1)/usr/lib/python2.7/site-packages
endef

define Package/python-sdk-auth/postrm
#!/bin/sh
rm -rf /usr/lib/python2.7/site-packages/HologramAuth
rm -rf /usr/lib/python2.7/site-packages/python_sdk_auth-0.1.5.dist-info
endef

$(eval $(call BuildPackage,python-sdk-auth))
