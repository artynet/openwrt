#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-hjson
PKG_VERSION:=2.0.2
PKG_RELEASE:=1
PKG_MAINTAINER:=Micke Prag <micke.prag@telldus.se>
PKG_LICENSE:=Python-2.0

PKG_SOURCE:=hjson-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/89/15/4da8c596166476dde42d3ce1bb4b59e4e805cb9cf1429830db1199762871/
PKG_MD5SUM:=3895ae6bad760b692a0afa7e62af11ab

PKG_BUILD_DIR:=$(BUILD_DIR)/hjson-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-hjson
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=JSON for Humans
  DEFAULT:=m
  URL:=https://pypi.python.org/pypi/hjson
  DEPENDS:=+python +python-light
endef

define Package/python-hjson/description
	JSON for Humans. A configuration file format with relaxed syntax, fewer mistakes and more comments.
endef

define Build/Compile
	$(call Build/Compile/PyMod,,install --prefix=/usr --root="$(PKG_INSTALL_DIR)")
endef

define Package/python-hjson/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(CP) \
	    $(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
	    $(1)$(PYTHON_PKG_DIR)
endef

$(eval $(call BuildPackage,python-hjson))
