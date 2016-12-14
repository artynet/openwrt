#
# Copyright (C) 2015 Arduino Srl
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=snap4arduino
PKG_VERSION:=1.2.1
PKG_RELEASE:=3

PKG_SOURCE_PROTO:=git

PKG_REVISION:=4d4447806b680a251363e1554b946b51fe8fb63b
PKG_SOURCE_VERSION=$(PKG_REVISION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_URL:=https://github.com/bromagosa/Snap4Arduino.git
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REVISION).tar.gz

PKG_BUILD_PARALLEL:=3

include $(INCLUDE_DIR)/package.mk

define Package/snap4arduino
  DEPENDS:=+node +node-canvas +node-firmata +node-ideino-linino-lib +node-es6-shim +node-ws +node-daemon
  SUBMENU:=Node.js
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Snap Interpreter for Snap4Arduino
  URL:=http://nodejs.org/
endef

define Package/snap4arduino/description
	Snap Interpreter for Snap4Arduino
endef

define Build/Prepare
	$(Build/Prepare/Default)
	(cd $(PKG_BUILD_DIR) && ./build --platform=embedded/ipkg --keeptmp)
endef

define Build/Compile
	# NOOP
endef

define Package/snap4arduino/install
	$(INSTALL_DIR) $(1)/usr/share/snap4arduino
	$(CP) -R $(PKG_BUILD_DIR)/tmp/ipkg_files/data/usr/share/snap4arduino/* $(1)/usr/share/snap4arduino

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tmp/ipkg_files/data/etc/init.d/snap4arduino-daemon $(1)/etc/init.d

	$(INSTALL_DIR) $(1)/usr/bin
	ln -sf /usr/share/snap4arduino/snap.js $(1)/usr/bin/snap
endef

define Package/snap4arduino/postinst
if [ -d /usr/share/snap4arduino ]
then
	ln -s /usr/share/snap4arduino/snap /osjs/dist/snap
	ln -s /usr/lib/node_modules /usr/share/snap4arduino/node_modules
fi
endef

define Package/snap4arduino/postrm
if [ -d /usr/share/snap4arduino ]
then
	rm -rf /usr/share/snap4arduino
	rm /osjs/dist/snap
fi
endef

$(eval $(call BuildPackage,snap4arduino))
