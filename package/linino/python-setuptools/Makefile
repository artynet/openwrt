#
# Copyright (C) 2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-setuptools
PKG_VERSION:=28.0.0
PKG_RELEASE:=1

PKG_SOURCE:=setuptools-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/f7/94/eee867605a99ac113c4108534ad7c292ed48bf1d06dfe7b63daa51e49987/
PKG_MD5SUM:=9b23df90e1510c7353a5cf07873dcd22

PKG_BUILD_DIR:=$(BUILD_DIR)/setuptools-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-setuptools
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Tool for installing Python packages.
  URL:=https://bitbucket.org/pypa/setuptools
  DEPENDS:=+python
  MAINTAINER:=Alexandru Ardelean <ardeleanalex@gmail.com>
endef

define Package/python-setuptools/description
  Easily download, build, install, upgrade, and uninstall Python packages
endef

define Build/Compile
	$(call Build/Compile/PyMod,,\
		install --root="$(PKG_INSTALL_DIR)" --prefix="/usr" \
		--single-version-externally-managed \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(PYTHON_LIB_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(PYTHON_LIB_DIR)
endef

define PyPackage/python-setuptools/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
endef

$(eval $(call PyPackage,python-setuptools))
$(eval $(call BuildPackage,python-setuptools))
