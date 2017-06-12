#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-wifi
PKG_VERSION:=0.6.1
PKG_RELEASE:=1
PKG_MAINTAINER:=Micke Prag <micke.prag@telldus.se>
PKG_LICENSE:=Python-2.0

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=https://pypi.python.org/pypi/python-wifi/
# PKG_MD5SUM:=794506184df83ef2290de0d18803dd11

# PKG_BUILD_DIR:=$(BUILD_DIR)/pyserial-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-wifi
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Simple library for controlling PPP connections with pppd
  DEFAULT:=m
  URL:=http://pythonwifi.tuxfamily.org
  DEPENDS:=+python +python-light
endef

define Package/python-wifi/description
	Python WiFi is a Python module that provides read and write access to a wireless network card's
	capabilities using the Linux Wireless Extensions.
endef

define Build/Compile
	$(call Build/Compile/PyMod,,install --prefix="$(PKG_INSTALL_DIR)/usr")
endef

define Package/python-wifi/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(CP) \
	    $(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
	    $(1)$(PYTHON_PKG_DIR)
endef

$(eval $(call BuildPackage,python-wifi))
