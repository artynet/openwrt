#
# Copyright (C) 2006-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=node4
PKG_VERSION:=v4.4.7
PKG_RELEASE:=5

PKG_SOURCE:=node-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://nodejs.org/dist/${PKG_VERSION}
PKG_MD5SUM:=

PKG_BUILD_DIR:=$(BUILD_DIR)/node-$(PKG_VERSION)

PKG_BUILD_DEPENDS:=python/host
PKG_INSTALL:=1

PKG_MAINTAINER:=John Crispin <blogic@openwrt.org>
PKG_LICENSE:=

include $(INCLUDE_DIR)/package.mk

define Package/node4
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Node.js
  TITLE:=Node.js is a platform built on Chrome's JavaScript runtime
  URL:=http://nodejs.org/
  DEPENDS:=+libpthread +librt +libstdcpp +libopenssl +libuv
endef

define Package/node4/description
  Node.js® is a JavaScript runtime built on Chrome's V8 JavaScript engine. Node.js uses
  an event-driven, non-blocking I/O model that makes it lightweight and efficient. Node.js'
   package ecosystem, npm, is the largest ecosystem of open source libraries in the world.
endef

# NODEJS:=node-$(PKG_VERSION)-linux-x86.tar.gz

# Distribution URL doesn't always have the correct version
# Using the OpenWrt/Linino mirror provides a stable version
#define Download/nodebin
#  URL:=https://nodejs.org/dist/$(PKG_VERSION)/
#  FILE:=$(NODEJS)
#  # MD5SUM:=93b17e543e7974b933aa809fc95a9878
#endef

# Fetch latest nodejs that works
# Yes, I know this is ugly
#define Build/Prepare
#    $(call Build/Prepare/Default)
#	# $(eval $(call Download,nodebin))
#	# $(TAR) -xvf $(DL_DIR)/$(NODEJS) -C $(STAGING_DIR_HOST) --strip-components=1
#endef

CPU:=$(subst x86_64,x64,$(subst i386,ia32,$(ARCH)))

MAKE_VARS += \
	DESTCPU=$(CPU)

CONFIGURE_ARGS= \
	--dest-cpu=$(CPU) \
	--dest-os=linux \
	--without-snapshot \
	--shared-zlib \
	--shared-openssl \
	--with-mips-float-abi=soft \
	--prefix=/usr

#define Build/InstallDev
#	$(INSTALL_DIR) $(1)/usr/include
#	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
#endef

define Package/node4/install
	mkdir -p $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/out/Release/node $(1)/usr/bin/

	mkdir -p $(1)/usr/lib/node_modules
	$(CP) $(PKG_BUILD_DIR)/deps/npm $(1)/usr/lib/node_modules
	ln -sf ../lib/node_modules/npm/bin/npm-cli.js $(1)/usr/bin/npm
endef

$(eval $(call BuildPackage,node4))
