#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=flite
PKG_VERSION:=2.0.0-release
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.festvox.org/flite/packed/flite-2.0/
# PKG_MD5SUM:=b7c3523b3bbc6f29ce61e6650cd9a428

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/flite
  SECTION:=sound
  CATEGORY:=Sound
  DEPENDS:=+libc +libstdcpp +alsa-lib
  TITLE:=Text-to-speech for embedded systems
  URL:=http://www.speech.cs.cmu.edu/flite/index.html
endef

define Package/flite/description
	CMU Flite (festival-lite) is a small, fast run-time open source text to speech synthesis engine developed
	at CMU and primarily designed for small embedded machines and/or large servers. Flite is designed as
	an alternative text to speech synthesis engine to Festival for voices built using the FestVox suite of voice building tools.
endef

TARGET_LDFLAGS += -lm

CONFIGURE_ARGS += --enable-shared

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/flite
	$(CP) $(PKG_INSTALL_DIR)/usr/include/flite/{cst,flite}*.h $(1)/usr/include/flite/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libflite*.so.* $(1)/usr/lib/
endef

define Package/flite/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/flite $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libflite*.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,flite))
