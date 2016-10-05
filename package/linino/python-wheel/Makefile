#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=wheel
PKG_VERSION:=0.29.0
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/source/w/wheel/
# PKG_MD5SUM:=6f9e9a617ffb904c6eb4f5b4696790db

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-wheel
  SECTION:=language-python
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=python-wheel
  URL:=https://pypi.python.org/pypi/pyFirmata
  DEPENDS:=+python-base +python-light
endef

define Package/python-wheel/description
Python module interface to the Firmata library.
endef

define Build/Compile
	$(call Build/Compile/PyMod,,install --prefix=/usr --root=$(PKG_INSTALL_DIR))
endef

define Package/python-wheel/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(1)$(PYTHON_PKG_DIR)
endef

$(eval $(call BuildPackage,python-wheel))
