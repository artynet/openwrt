#
# Copyright (C) 2014 Arduino LLC
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NPM_NAME:=mediacenterjs
PKG_NAME:=node-$(PKG_NPM_NAME)
PKG_VERSION:=0.1.3
PKG_RELEASE:=2

PKG_REVISION:=d546b78d56a967badf99a4bf5c5f3de3468db0f5

PKG_SOURCE_PROTO:=git

PKG_SOURCE:=node-mediacenterjs-$(PKG_VERSION)-$(PKG_REVISION).tar.gz
PKG_SOURCE_URL:=https://github.com/jansmolders86/mediacenterjs.git
PKG_SOURCE_VERSION:=$(PKG_REVISION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

PKG_BUILD_DEPENDS:=node
PKG_NODE_VERSION:=6.10.2

include $(INCLUDE_DIR)/package.mk

define Package/node-mediacenterjs
  DEPENDS:=+node
  SUBMENU:=Node.js
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=A NodeJS based mediacenter for your browser
  URL:=https://www.npmjs.org/package/mediacenterjs
endef

define Package/node-mediacenterjs/description
	A NodeJS based mediacenter for your browser
endef

define Build/Prepare
	/bin/tar xzf $(DL_DIR)/$(PKG_SOURCE) -C $(PKG_BUILD_DIR) --strip-components 1
	$(Build/Patch)
endef

define Build/Compile
	$(MAKE_FLAGS) \
	GYPFLAGS="-Dv8_use_mips_abi_hardfloat=false -Dv8_can_use_fpu_instructions=false" \
	LDFLAGS="-L$(TOOLCHAIN_DIR)/lib/ -Wl,-rpath-link $(TOOLCHAIN_DIR)/lib/ -L$(STAGING_DIR)/usr/lib $(EXTRA_LDFLAGS)" \
	CFLAGS="$(TARGET_CFLAGS) $(EXTRA_CFLAGS) $(TARGET_CPPFLAGS) $(EXTRA_CPPFLAGS) -I$(STAGING_DIR)/usr/include" \
	CXXFLAGS="$(TARGET_CXXFLAGS) $(EXTRA_CXXFLAGS) $(TARGET_CPPFLAGS) $(EXTRA_CPPFLAGS) -I$(STAGING_DIR)/usr/include" \
	npm_config_nodedir=$(BUILD_DIR)/node-v$(PKG_NODE_VERSION)/ \
	PREFIX="$(PKG_INSTALL_DIR)/usr/" \
	$(STAGING_DIR_HOST)/bin/npm install --build-from-source --target_arch=mips -g $(PKG_BUILD_DIR)
endef

define Package/node-mediacenterjs/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/node_modules $(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) ./files/mediacenterjs $(1)/usr/bin/
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

$(eval $(call BuildPackage,node-mediacenterjs))
