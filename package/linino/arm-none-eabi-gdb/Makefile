#
# Copyright (C) 2006-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=arm-none-eabi-gdb
PKG_VERSION:=7.8
PKG_RELEASE:=1

PKG_SOURCE:=gdb-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=@GNU/gdb
PKG_MD5SUM:=bd958fe9019d7c7896f29f6724a764ed

PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=1
PKG_LICENSE:=GPL-3.0+

include $(INCLUDE_DIR)/package.mk

define Package/arm-none-eabi-gdb/Default
  SECTION:=devel
  CATEGORY:=Development
  DEPENDS:=+!USE_MUSL:libthread-db +PACKAGE_zlib:zlib
  URL:=http://www.gnu.org/software/arm-none-eabi-gdb/
endef

define Package/arm-none-eabi-gdb
$(call Package/arm-none-eabi-gdb/Default)
  TITLE:=GNU ARM Debugger
  DEPENDS+=+libreadline +libncurses +zlib +liblzma
endef

define Package/arm-none-eabi-gdb/description
GDB, the GNU Project debugger, allows you to see what is going on `inside'
another program while it executes -- or what another program was doing at the
moment it crashed.
endef

# XXX: add --disable-werror to prevent build failure with arm
CONFIGURE_ARGS+= \
	--with-system-readline \
	--without-expat \
	--disable-werror \
	--target=arm-none-eabi \
	--disable-nls \
	--disable-binutils \
	--disable-sim \
	--with-python=no
	
CONFIGURE_VARS+= \
	ac_cv_search_tgetent="$(TARGET_LDFLAGS) -lncurses -lreadline"

define Build/Prepare
	$(TAR) xvf $(DL_DIR)/$(PKG_SOURCE) -C $(PKG_BUILD_DIR) --strip-components=1
	$(Build/Patch)
endef

define Build/Compile
	+$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		CPPFLAGS="$(TARGET_CPPFLAGS)" \
		MAKEINFO=true all
endef

define Build/Install
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		CPPFLAGS="$(TARGET_CPPFLAGS)" \
		install-gdb
endef

define Package/arm-none-eabi-gdb/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/gdb $(1)/usr/bin/arm-none-eabi-gdb
endef

$(eval $(call BuildPackage,arm-none-eabi-gdb))
