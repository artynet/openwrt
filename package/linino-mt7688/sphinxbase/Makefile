#
# Copyright (c) 2013 Arduino LLC. All right reserved.
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=sphinxbase
PKG_VERSION:=5
PKG_RELEASE:=2

PKG_REV:=66560b4

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/cmusphinx/sphinxbase.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV)
PKG_SOURCE_VERSION=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)

PKG_FIXUP:=libtool autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/sphinxbase
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=sphinxbase cmuspeech
	DEPENDS:=+libc +libstdcpp +libpthread +pulseaudio-daemon +libsamplerate
endef

define Package/sphinxbase/description
	Open,configurate sound device or sources,
	Read voice samples.
endef

TARGET_LDFLAGS +=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib/pulseaudio

CONFIGURE_ARGS += \
	--without-lapack \
	--without-python \
	--disable-dependency-tracking \
	--disable-debug

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/sphinxbase $(1)/usr/include/

	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libsphinxbase.{a,la,so*} $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libsphinxad.{a,la,so*} $(1)/usr/lib

	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/sphinxbase.pc $(1)/usr/lib/pkgconfig/
endef

# define Build/Compile
#     $(MAKE) LIBS="$(LIBS) -lm -lpulse-simple" -C $(PKG_BUILD_DIR)
# endef

define Package/sphinxbase/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/sphinx_* $(1)/usr/bin

	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libsphinxbase.{a,la,so*} $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libsphinxad.{a,la,so*} $(1)/usr/lib
endef

$(eval $(call BuildPackage,sphinxbase))
