#
# Copyright (C) 2006-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=node
PKG_VERSION:=v6.11.3
PKG_RELEASE:=3

PKG_SOURCE:=node-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=http://nodejs.org/dist/${PKG_VERSION}
PKG_MD5SUM:=b3aacb67c695b4d468b205d88b1c2fb0

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

CPUHOST:=$(subst x86_64-linux-gnu,x64,$(subst i686-linux-gnu,x86,$(GNU_HOST_NAME)))

NODEJS:=node-$(PKG_VERSION)-linux-$(CPUHOST).tar.xz

ifeq ($(CPUHOST),x64)
    MD5SUM_NODE:=98d1f3ba45f0fe310178e8922a81fd28
endif
ifeq ($(CPUHOST),x86)
    MD5SUM_NODE:=d4f46fdfa919eba5795fcf22c4b109b0
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

ifeq ($(CONFIG_NODEJS_ICU),y)
CONFIGURE_ARGS+= \
	--with-intl=system-icu
else
CONFIGURE_ARGS+= \
	--with-intl=none
endif

ifeq ($(findstring mips,$(NODEJS_CPU)),mips)
ifeq ($(CONFIG_SOFT_FLOAT),y)
CONFIGURE_ARGS+= \
	--with-mips-float-abi=soft
endif
endif

ifeq ($(findstring arm,$(NODEJS_CPU)),arm)
ifeq ($(CONFIG_SOFT_FLOAT),y)
CONFIGURE_ARGS+= \
	--with-arm-float-abi=softfp
endif

ifeq ($(findstring neon,$(CONFIG_CPU_TYPE))
CONFIGURE_ARGS+= \
	--with-arm-fpu=neon
endif

ifeq ($(findstring vfpv3,$(CONFIG_CPU_TYPE))
CONFIGURE_ARGS+= \
	--with-arm-fpu=vfpv3
endif
endif

define Package/node/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/node $(1)/usr/bin/

	$(INSTALL_DIR) $(1)/usr/lib/node_modules
	$(CP) -R $(PKG_INSTALL_DIR)/usr/lib/node_modules/* $(1)/usr/lib/node_modules/
	$(LN) ../lib/node_modules/npm/bin/npm-cli.js $(1)/usr/bin/npm
endef

define Package/node/postrm
#!/bin/sh
# check if we are on real system
if `grep -qs '/opt' /proc/mounts`
then
	PREFIX="/opt/usr"
else
	PREFIX="/usr"
fi

# completely uninstall npm
rm -rf $$PREFIX/usr/lib/node_modules/npm

exit 0
endef

$(eval $(call BuildPackage,node))
