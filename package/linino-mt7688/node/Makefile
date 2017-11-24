#
# Copyright (C) 2006-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=node
PKG_VERSION:=v8.9.1
PKG_RELEASE:=2

PKG_SOURCE:=node-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=http://nodejs.org/dist/${PKG_VERSION}
PKG_MD5SUM:=026e066a3d8c69fb1bc320385cfc65f2

PKG_BUILD_DEPENDS:=python/host
PKG_INSTALL:=1
PKG_USE_MIPS16:=0

PKG_BUILD_DIR:=$(BUILD_DIR)/node-$(PKG_VERSION)

PKG_BUILD_PARALLEL:=1

PKG_MAINTAINER:=John Crispin <blogic@openwrt.org>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk

define Package/node
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Node.js
  TITLE:=Node.js is a platform built on Chrome's JavaScript runtime
  URL:=http://nodejs.org/
  DEPENDS:=+libstdcpp +libopenssl +zlib +USE_UCLIBC:libpthread +USE_UCLIBC:librt +NODEJS_ICU:icu
endef

define Package/node/description
  Node.js® is a JavaScript runtime built on Chrome's V8 JavaScript engine. Node.js uses
  an event-driven, non-blocking I/O model that makes it lightweight and efficient. Node.js'
   package ecosystem, npm, is the largest ecosystem of open source libraries in the world.
endef

define Package/node/config
	menu "Module Selection"

	config NODEJS_ICU
		bool "enable i18n features"
		default n

	endmenu
endef

CPUHOST:=$(subst x86_64-linux-gnu,x64,$(subst x86_64-pc-linux-gnu,x64,$(subst i686-linux-gnu,x86,$(subst i686-pc-linux-gnu,x86,$(GNU_HOST_NAME)))))

NODEJS:=node-$(PKG_VERSION)-linux-$(CPUHOST).tar.xz

ifeq ($(CPUHOST),x64)
    MD5SUM_NODE:=2f51560b53e004d2c6689ddbfe288065
endif
ifeq ($(CPUHOST),x86)
    MD5SUM_NODE:=node-v8.9.1-linux-x86.tar.xz
endif

# Distribution URL doesn't always have the correct version
# Using the OpenWrt/Linino mirror provides a stable version
define Download/nodebin
	URL:=https://nodejs.org/dist/$(PKG_VERSION)/
	FILE:=$(NODEJS)
	MD5SUM:=$(MD5SUM_NODE)
endef

# prepare step

define Build/Prepare
	$(call Build/Prepare/Default)
	$(eval $(call Download,nodebin))
	$(TAR) -xvf $(DL_DIR)/$(NODEJS) -C $(STAGING_DIR_HOST) --strip-components=1
	$(STAGING_DIR_HOST)/bin/npm update npm -g $(STAGING_DIR_HOST)/lib/node_modules
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
endef

# actual node.js configuration

NODEJS_CPU:=$(subst powerpc,ppc,$(subst aarch64,arm64,$(subst x86_64,x64,$(subst i386,ia32,$(ARCH)))))

MAKE_VARS += \
	DESTCPU=$(NODEJS_CPU)

CONFIGURE_ARGS= \
	--dest-cpu=$(NODEJS_CPU) \
	--dest-os=linux \
	--without-snapshot \
	--shared-zlib \
	--shared-openssl \
	--prefix=/usr

ifneq ($(findstring arm,$(NODEJS_CPU)),)
ifeq ($(CONFIG_SOFTFLOAT),y)
CONFIGURE_ARGS+= --with-arm-float-abi=softfp
else

CONFIGURE_ARGS+= --with-arm-float-abi=hard

ifneq ($(findstring vfp,$(CONFIG_CPU_TYPE)),)
ARM_FPU=vfp
endif

ifneq ($(findstring vfpv3,$(CONFIG_CPU_TYPE)),)
ARM_FPU=vfpv3
endif

ifneq ($(findstring vfpv3-d16,$(CONFIG_CPU_TYPE)),)
ARM_FPU=vfpv3-d16
endif

ifneq ($(findstring neon,$(CONFIG_CPU_TYPE)),)
ARM_FPU=neon
endif

CONFIGURE_ARGS+= --with-arm-fpu=$(ARM_FPU)
endif
endif

ifneq ($(findstring mips,$(NODEJS_CPU)),)
ifeq ($(CONFIG_SOFT_FLOAT),y)
CONFIGURE_ARGS+= \
	--with-mips-float-abi=soft
endif
endif

ifeq ($(CONFIG_NODEJS_ICU),y)
CONFIGURE_ARGS+= \
	--with-intl=system-icu
else
CONFIGURE_ARGS+= \
	--with-intl=none
endif

define Package/node/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/node $(1)/usr/bin/

	$(INSTALL_DIR) $(1)/usr/lib/node_modules
	$(CP) -R $(PKG_INSTALL_DIR)/usr/lib/node_modules/* $(1)/usr/lib/node_modules/
	$(LN) ../lib/node_modules/npm/bin/npm-cli.js $(1)/usr/bin/npm
endef

$(eval $(call BuildPackage,node))
