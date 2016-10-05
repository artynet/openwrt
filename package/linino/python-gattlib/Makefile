#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gattlib
PKG_VERSION:=0.20150805
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/source/g/gattlib/
PKG_BUILD_DIR:=$(BUILD_DIR)/gattlib-$(PKG_VERSION)
PKG_MD5SUM:=f620eca190bb7acd67c7aafecaedb6c2

PKG_BUILD_DEPENDS:=+python-base +python-light +bluez-libs +boost-python +boost-thread

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-gattlib
  SECTION:=language-python
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Bluetooth Python extension module
  URL:=https://pypi.python.org/pypi/PyBluez/
  DEPENDS:=+libc +libstdcpp +glib2 +python-base +python-light +bluez-libs +boost-python +boost-thread
endef

define Package/python-gattlib/description
	Bluetooth Python extension module to allow Python ” “developers to use system Bluetooth resources.
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	rm -v $(PKG_BUILD_DIR)/src/*.o
endef

define Build/Compile
	$(call Build/Compile/PyMod,,install --prefix=/usr --root=$(PKG_INSTALL_DIR))
endef

define Package/python-gattlib/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(1)$(PYTHON_PKG_DIR)
endef

$(eval $(call BuildPackage,python-gattlib))
