#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=sleek
PKG_VERSION:=1.3.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/fritzy/SleekXMPP/archive/
PKG_BUILD_DIR:=$(BUILD_DIR)/SleekXMPP-$(PKG_NAME)-$(PKG_VERSION)
PKG_MD5SUM:=

PKG_BUILD_DEPENDS:=+python-xml +python-openssl +python-pyserial

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-sleekxmpp
  SECTION:=language-python
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=python-sleekxmpp
  URL:=http://sourceforge.net/projects/pysleekxmpp
  DEPENDS:=+python +python-xml +python-openssl +python-pyserial
endef

define Package/python-sleekxmpp/description
Python module interface to the sleek xmpp module
endef

define Build/Compile
	$(call Build/Compile/PyMod,,install --prefix=/usr --root=$(PKG_INSTALL_DIR))
endef

define Package/python-sleekxmpp/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(1)$(PYTHON_PKG_DIR)
endef

$(eval $(call BuildPackage,python-sleekxmpp))
