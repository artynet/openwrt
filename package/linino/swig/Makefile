#
# Copyright (C) 2006-2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=swig
PKG_VERSION:=3.0.12
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_MD5SUM:=82133dfa7bba75ff9ad98a7046be687c
PKG_INSTALL:=1

PKG_MAINTAINER:=John Crispin <blogic@openwrt.org>
PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=swig/host tcl

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/swig
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=swig binding generator
  DEPENDS:=+libc +tcl +libpcre +libc +libstdcpp
  # BUILDONLY:=1
endef

HOST_CONFIGURE_ARGS+= \
	--without-pcre

CONFIGURE_ARGS += \
	--with-tclconfig=$(STAGING_DIR)/usr/lib

define Package/swig/description
  tool that generates bindings for various languages
endef

define Host/Configure
	$(call Host/Configure/Default)
endef

define Host/Compile
	$(call Host/Compile/Default)
endef

define Host/Install
	$(call Host/Install/Default)
endef

define Package/swig/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/share

	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin
	$(CP) -R $(PKG_INSTALL_DIR)/usr/share/swig $(1)/usr/share
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,swig))
