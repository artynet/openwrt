#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=festival
PKG_VERSION:=2.4
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-release.tar.gz
PKG_SOURCE_URL:=http://festvox.org/packed/festival/2.4/
# PKG_MD5SUM:=b7c3523b3bbc6f29ce61e6650cd9a428

PKG_FIXUP:=libtool autoreconf
PKG_BUILD_DIR:=$(BUILD_DIR)/festival
PKG_BUILD_DEPENDS:=speechtools

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/festival
  SECTION:=sound
  CATEGORY:=Sound
  DEPENDS:=+libc +libstdcpp +pulseaudio-daemon +speechtools
  TITLE:=Text-to-speech for embedded systems - complete version
  URL:=http://festvox.org/festival/
endef

define Package/festival/description
	University of Edinburgh's Festival Speech Synthesis Systems is a free software multi-lingual speech
	synthesis workbench that runs on multiple-platforms offering black box text to speech, as well as
	an open architecture for research in speech synthesis. It designed as a component of large speech technology systems.
endef

TARGET_LDFLAGS += -lm

CONFIGURE_ARGS += --enable-shared

define Package/festival/install
	$(INSTALL_DIR) $(1)/usr/bin

	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/{festival_server,festival_server_control,text2wave} $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/main/{festival,festival_client} $(1)/usr/bin/

	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)//lib/etc/unknown_DebianGNULinux/audsp $(1)/usr/lib
endef

$(eval $(call BuildPackage,festival))
