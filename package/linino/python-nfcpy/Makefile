#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-nfcpy
PKG_RELEASE:=7

PKG_REVISION:=77f9521d8c044301b4c30bd6ccf320e16c109055
PKG_VERSION:=0.12.x

PKG_SOURCE_PROTO:=git

PKG_SOURCE:=nfcpy-$(PKG_VERSION)-$(PKG_REVISION).tar.gz
PKG_SOURCE_URL:=https://github.com/artynet/nfcpy.git
PKG_SOURCE_VERSION:=$(PKG_REVISION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-nfcpy
  SECTION:=language-python
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=python-nfcpy
  URL:=https://launchpad.net/nfcpy
  DEPENDS:=+python-base +python-light +python-logging +python-codecs +python-ctypes +python-usb +python-pyserial
endef

define Package/python-nfcpy/description
	Python modules for NFC connectivity
endef

define Package/python-nfcpy-examples
  SECTION:=language-python
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=python-nfcpy-examples
  URL:=https://launchpad.net/nfcpy
  DEPENDS:=+python-base +python-light +python-nfcpy
endef

define Package/python-nfcpy-examples/description
	Python modules for NFC connectivity (Examples)
endef

define Build/Compile
	$(call Build/Compile/PyMod,,install --prefix=/usr --root=$(PKG_INSTALL_DIR))
endef

define Package/python-nfcpy/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(1)$(PYTHON_PKG_DIR)
endef

define Package/python-nfcpy-examples/install
	$(INSTALL_DIR) $(1)/usr/share/nfcpy
	$(CP) -R $(PKG_BUILD_DIR)/examples $(1)/usr/share/nfcpy
endef

define Package/python-nfcpy-examples/postrm
#!/bin/sh
if [ -d $${IPKG_INSTROOT}/usr/share/nfcpy ]
then
	rm -rf $${IPKG_INSTROOT}/usr/share/nfcpy
fi
endef

$(eval $(call BuildPackage,python-nfcpy))
$(eval $(call BuildPackage,python-nfcpy-examples))
