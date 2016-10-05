#
# Copyright (C) 2015 Arduino Srl
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=snap-interpreter
PKG_VERSION:=v0.1.2-beta
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/bromagosa/snap-interpreter/archive/
# PKG_MD5SUM:=3f45f994f1f02736576bf7bff1870897

PKG_BUILD_DIR:=$(BUILD_DIR)/snap-interpreter-0.1.2-beta

PKG_BUILD_PARALLEL:=3

include $(INCLUDE_DIR)/package.mk

define Package/snap-interpreter
  DEPENDS:=+node +node-canvas +node-firmata +node-ideino-linino-lib +node-es6-shim +node-ws
  SUBMENU:=Node.js
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Snap Interpreter for Snap4Arduino
  URL:=http://nodejs.org/
endef

define Package/snap-interpreter/description
	Snap Interpreter for Snap4Arduino
endef

SNAP4:=1.1.6-beta-rc.tar.gz

# Distribution URL doesn't always have the correct version
# Using the OpenWrt/Linino mirror provides a stable version
define Download/snapmaster
  URL:=https://github.com/edutec/Snap4Arduino/archive/
  FILE:=$(SNAP4)
  # MD5SUM:=8893f1f5ce16c612ba2805432edc0138
endef

define Build/Prepare
	mkdir $(PKG_BUILD_DIR)/temp
	$(call Build/Prepare/Default)
	$(eval $(call Download,snapmaster))
	$(TAR) -xvf $(DL_DIR)/$(SNAP4) -C $(PKG_BUILD_DIR)/temp --strip-components=1
	$(TAR) -xvf $(DL_DIR)/$(PKG_SOURCE) -C $(PKG_BUILD_DIR)/temp --strip-components=1
	rm $(PKG_BUILD_DIR)/temp/{*.sh,*.md}
endef

define Build/Compile
	# NOOP
endef

define Package/snap-interpreter/install
	$(INSTALL_DIR) $(1)/usr/share/snap-interpreter
	$(CP) -R $(PKG_BUILD_DIR)/temp/* $(1)/usr/share/snap-interpreter
    #
	$(INSTALL_DIR) $(1)/usr/bin
	ln -sf /usr/share/snap-interpreter/snap.js $(1)/usr/bin/snap
endef

define Package/snap-interpreter/postinst
if [ -d /usr/share/snap-interpreter ]
then
	ln -s /usr/share/snap-interpreter/snap /osjs/dist/snap
fi
endef

define Package/snap-interpreter/postrm
if [ -d /usr/share/snap-interpreter ]
then
	rm -rf /usr/share/snap-interpreter
	rm /osjs/dist/snap
fi
endef

$(eval $(call BuildPackage,snap-interpreter))
