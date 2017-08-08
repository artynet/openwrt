#
# Copyright (C) 2014 Arduino LLC
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NPM_NAME:=es6-shim
PKG_NAME:=node-$(PKG_NPM_NAME)
PKG_VERSION:=0.35.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NPM_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://registry.npmjs.com/$(PKG_NPM_NAME)/-/
# PKG_MD5SUM:=54cc3fa9dfc7a44b5153e45b8cae9fdb

PKG_BUILD_DEPENDS:=node
PKG_NODE_VERSION:=6.11.2

include $(INCLUDE_DIR)/package.mk

define Package/node-es6-shim
  DEPENDS:=+node
  SUBMENU:=Node.js
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=CMAScript 6 (Harmony) compatibility shims for legacy JavaScript engines
  URL:=https://www.npmjs.org/package/es6-shim
endef

define Package/node-es6-shim/description
	Provides compatibility shims so that legacy JavaScript engines behave as closely as possible to ECMAScript 6 (Harmony).
endef

define Build/Prepare
	/bin/tar xzf $(DL_DIR)/$(PKG_SOURCE) -C $(PKG_BUILD_DIR) --strip-components 1
	$(Build/Patch)
endef

define Build/Compile
	$(MAKE_FLAGS) \
	PATH="/usr/bin/:$(PATH)" \
	GYPFLAGS="-Dv8_use_mips_abi_hardfloat=false -Dv8_can_use_fpu_instructions=false" \
	LDFLAGS="-L$(TOOLCHAIN_DIR)/lib/ -Wl,-rpath-link $(TOOLCHAIN_DIR)/lib/" \
	npm_config_arch=mips \
	npm_config_nodedir=$(BUILD_DIR)/node-v$(PKG_NODE_VERSION)/ \
	PREFIX="$(PKG_INSTALL_DIR)/usr/" \
	$(STAGING_DIR_HOST)/bin/npm install --build-from-source --target_arch=mips -g $(PKG_BUILD_DIR)
endef

define Package/node-es6-shim/install
	$(INSTALL_DIR) $(1)/usr/lib/

	$(CP) $(PKG_INSTALL_DIR)/usr/lib/node_modules $(1)/usr/lib/
endef

define Package/$(PKG_NAME)/postrm
#!/bin/sh
# check if we are on a real system
if `grep -qs '/opt' /proc/mounts`
then
    rm -rvf /opt/usr/lib/node_modules/$(PKG_NPM_NAME)
else
    rm -rvf /usr/lib/node_modules/$(PKG_NPM_NAME)
fi
endef

$(eval $(call BuildPackage,node-es6-shim))
