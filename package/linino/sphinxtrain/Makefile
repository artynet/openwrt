#
# Copyright (c) 2013 Arduino LLC. All right reserved.
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=sphinxtrain
PKG_VERSION:=1.0.8
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/cmusphinx

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/sphinxtrain
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=sphinxtrain-1.0.8
	DEPENDS:=+libc +libstdcpp +libpthread +sphinxbase
endef

define Package/sphinxtrain/description
	Open,configurate sound device or sources,
	Read voice samples.
endef

CONFIGURE_ARGS += --without-python \
	--without-test \
	--enable-shared

TARGET_LDFLAGS +=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib/pulseaudio

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/sphinxtrain $(1)/usr/include/
endef

define Package/sphinxtrain/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/sphinxtrain $(1)/usr/bin
endef

$(eval $(call BuildPackage,sphinxtrain))
