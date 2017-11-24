#
# Copyright (c) 2013 Arduino LLC. All right reserved.
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=pocketsphinx
PKG_VERSION:=5
PKG_RELEASE:=2

# PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
# PKG_SOURCE_URL:=@SF/cmusphinx

PKG_REV:=26c6d9d

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/cmusphinx/pocketsphinx.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV)
PKG_SOURCE_VERSION=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)

PKG_BUILD_DEPENDS:=swig/host

PKG_FIXUP:=libtool autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/pocketsphinx
	SECTION:=libs
	CATEGORY:=Libraries
	TITLE:=pocketsphinx
	DEPENDS:=+libc +libstdcpp +libpthread +sphinxbase
endef

define Package/pocketsphinx/description
	Open,configurate sound device or sources,
	Read voice samples. (library)
endef

CONFIGURE_ARGS += \
	--without-python \
	--without-lapack \
	--with-sphinxbase=$(BUILD_DIR)/sphinxbase-5-66560b4

TARGET_LDFLAGS +=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib/pulseaudio

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/pocketsphinx $(1)/usr/include/

	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libpocketsphinx.{a,la,so*} $(1)/usr/lib

	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/pocketsphinx.pc $(1)/usr/lib/pkgconfig/
endef

define Package/pocketsphinx/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/pocketsphinx_* $(1)/usr/bin

	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libpocketsphinx.{a,la,so*} $(1)/usr/lib
endef

$(eval $(call BuildPackage,pocketsphinx))
