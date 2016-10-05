#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=PyBluez
PKG_VERSION:=0.22
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).zip
PKG_SOURCE_URL:=https://pypi.python.org/packages/source/P/PyBluez/
PKG_BUILD_DIR:=$(BUILD_DIR)/PyBluez-$(PKG_VERSION)
PKG_MD5SUM:=49dab9d5a8f0b798c8125c7f649be3cd

PKG_BUILD_DEPENDS:=+python-base +bluez-libs

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-bluez
  SECTION:=language-python
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Bluetooth Python extension module
  URL:=https://pypi.python.org/pypi/PyBluez/
  DEPENDS:=+python-base +python-light +bluez-libs
endef

define Package/python-bluez/description
	Bluetooth Python extension module to allow Python ” “developers to use system Bluetooth resources.
endef

define Build/Compile
	$(call Build/Compile/PyMod,,install --prefix=/usr --root=$(PKG_INSTALL_DIR))
endef

define Package/python-bluez/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(1)$(PYTHON_PKG_DIR)
endef

$(eval $(call BuildPackage,python-bluez))
