#
# Copyright (C) 2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luacurl3
PKG_VERSION:=0.3.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/Lua-cURL/Lua-cURLv3.git
PKG_SOURCE_REVISION:=7a5176cf37e709a37fcdecdc1c44a03551b4b9c6
PKG_SOURCE_VERSION:=$(PKG_SOURCE_REVISION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

# PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/luacurl3
  SUBMENU:=Lua
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Lua-cURL
  URL:=http://msva.github.io/lua-curl/
  DEPENDS:=+liblua +libcurl +librt
endef

define Package/luacurl3/description
 Lua-cURL is aiming for a full-fledged libcurl binding (easy/multi/share
 interface) to the functionality of Lua
endef

define Package/luacurl3/install
	$(INSTALL_DIR) $(1)/usr/lib/lua
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/lcurl.so $(1)/usr/lib/lua/
	
	$(INSTALL_DIR) $(1)/usr/lib/lua/cURL
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/src/lua/cURL.lua $(1)/usr/lib/lua
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/src/lua/cURL/safe.lua $(1)/usr/lib/lua/cURL
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/src/lua/cURL/utils.lua $(1)/usr/lib/lua/cURL

	$(INSTALL_DIR) $(1)/usr/lib/lua/cURL/impl
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/src/lua/cURL/impl/cURL.lua $(1)/usr/lib/lua/cURL/impl
endef

$(eval $(call BuildPackage,luacurl3))
