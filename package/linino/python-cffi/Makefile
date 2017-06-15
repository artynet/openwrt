#
# Copyright (C) 2015-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=cffi
PKG_VERSION:=1.10.0
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/5b/b9/790f8eafcdab455bcd3bd908161f802c9ce5adbf702a83aa7712fcc345b7/
PKG_HASH:=b3b02911eb1f6ada203b0763ba924234629b51586f72a21faacc638269f4ced5

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_UNPACK=$(HOST_TAR) -C $(PKG_BUILD_DIR) --strip-components=1 -xzf $(DL_DIR)/$(PKG_SOURCE)

HOST_BUILD_DEPENDS:=libffi/host python-pycparser/host
HOST_BUILD_DEPENDS+=python/host


PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Jeffery To <jeffery.to@gmail.com>

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-cffi/Default
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  URL:=http://cffi.readthedocs.org/
  DEPENDS:=+libffi
endef

define Package/python-cffi
$(call Package/python-cffi/Default)
  TITLE:=python-cffi
  DEPENDS+=+python-light +python-pycparser
  VARIANT:=python
endef

define Package/python-cffi/description
Foreign Function Interface for Python calling C code.
endef

define Host/Compile/python-cffi
	$(call Build/Compile/HostPyMod,,install --prefix="" --root="$(STAGING_DIR_HOST)")
endef

define Host/Compile
$(call Host/Compile/python-cffi)
endef

define Host/Install
endef

define Build/Compile
	$(call Build/Compile/PyMod,,install --prefix="$(PKG_INSTALL_DIR)/usr")
endef

define Package/python-cffi/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(1)$(PYTHON_PKG_DIR)
endef

$(eval $(call HostBuild))

$(eval $(call PyPackage,python-cffi))
$(eval $(call BuildPackage,python-cffi))
