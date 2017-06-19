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
PKG_SOURCE_URL:=https://pypi.python.org/packages/03/ac/dbb718dd284d41164ceeb3e3d007a1b2b15a688582076833f3fca67ae313/
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
	$(call Build/Compile/PyMod,,install --prefix=/usr --root="$(PKG_INSTALL_DIR)")
endef

define Build/InstallDev
	$(INSTALL_DIR) $(PYTHON_LIB_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(PYTHON_LIB_DIR)
endef

define Package/python-setuptools-scm/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(CP) \
	    $(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
	    $(1)$(PYTHON_PKG_DIR)
endef

$(eval $(call BuildPackage,python-setuptools-scm))
