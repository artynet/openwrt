#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NPM_NAME:=hid
PKG_NAME:=node-$(PKG_NPM_NAME)
PKG_VERSION:=0.5.1
PKG_RELEASE:=4

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/node-hid/node-hid.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=35d830b7810c87d32484d0a346621568c4849441
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz

PKG_BUILD_DEPENDS:=node
PKG_NODE_VERSION:=6.10.0

PKG_MAINTAINER:=John Crispin <blogic@openwrt.org>
PKG_LICENSE:=Custom
PKG_LICENSE_FILE:=

include $(INCLUDE_DIR)/package.mk

define Package/node-hid-latest
  DEPENDS:=+node
  SUBMENU:=Node.js
  SECTION:=lang
  CATEGORY:=Languages
  DEPENDS:=+libusb-1.0 +hidapi +libstdcpp
  TITLE:=Node.js package to access HID devices
  URL:=https://github.com/node-hid-latest/node-hid-latest
endef

define Package/node-hid-latest/description
 Node.js package to access HID devices
endef

CPU:=$(subst x86_64,x64,$(subst i386,ia32,$(ARCH)))

EXTRA_CFLAGS += -I$(STAGING_DIR)/usr/include/libusb-1.0 -I$(STAGING_DIR)/usr/lib/libiconv-stub/include/

define Build/Compile
	git init $(PKG_BUILD_DIR)
	$(MAKE_VARS) \
	$(MAKE_FLAGS) \
	npm_config_arch=$(CONFIG_ARCH) \
	npm_config_nodedir=$(BUILD_DIR)/node-v$(PKG_NODE_VERSION)/ \
	npm_config_cache=$(BUILD_DIR)/node-v$(PKG_NODE_VERSION)/npm-cache \
	PREFIX="$(PKG_INSTALL_DIR)/usr/" \
	$(STAGING_DIR_HOST)/bin/npm install --build-from-source --target_arch=$(CPU) -g $(PKG_BUILD_DIR)
endef

define Package/node-hid-latest/install
	mkdir -p $(1)/usr/lib/node/node-hid-latest/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/node_modules/* $(1)/usr/lib/node/
endef

$(eval $(call BuildPackage,node-hid-latest))
