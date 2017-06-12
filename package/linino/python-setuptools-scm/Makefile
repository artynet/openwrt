#
# Copyright (C) 2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-setuptools-scm
PKG_VERSION:=1.15.5
PKG_RELEASE:=1

PKG_SOURCE:=setuptools_scm-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/source/s/setuptools_scm/
PKG_MD5SUM:=13400b4b3fa128fbda1ee52a855c4eb1

PKG_BUILD_DIR:=$(BUILD_DIR)/setuptools_scm-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-setuptools-scm
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=The blessed package to manage your versions by scm tags
  DEFAULT:=m
  URL:=https://pypi.python.org/pypi/setuptools_scm
  DEPENDS:=+python
  MAINTAINER:=Alexandru Ardelean <ardeleanalex@gmail.com>
endef

define Package/python-setuptools-scm/description
	setuptools_scm handles managing your python package versions in scm metadata
	instead of declaring them as the version argument or in a scm managed file.
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

# define PyPackage/python-setuptools-scm/install
# 	$(INSTALL_DIR) $(1)/usr/bin
# 	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
# endef

$(eval $(call PyPackage,python-setuptools-scm))
$(eval $(call BuildPackage,python-setuptools-scm))
