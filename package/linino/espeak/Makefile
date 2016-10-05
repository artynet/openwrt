#
# Copyright (C) 2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=espeak
PKG_VERSION:=1.48.04
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-source.zip
PKG_SOURCE_URL:=@SF/espeak
PKG_MD5SUM:=cadd7482eaafe9239546bdc09fa244c3

PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILES:=License.txt
PKG_MAINTAINER:=Nicolas Thill <nico@openwrt.org>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)-source
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/espeak
  SECTION:=sound
  CATEGORY:=Sound
  DEPENDS:=+libpthread +libstdcpp +portaudio
  TITLE:=Speech synthesizer
  URL:=http://espeak.sourceforge.net/
endef

define Package/espeak-data
  SECTION:=sound
  CATEGORY:=Sound
  DEPENDS:=+libpthread +libstdcpp +portaudio +espeak-data
  TITLE:=Speech synthesizer (dataonly)
  URL:=http://espeak.sourceforge.net/
endef

define Package/espeak/description
 eSpeak is a compact open source software speech synthesizer for English and
 other languages.
endef

define Package/espeak-data/description
 eSpeak language data for detection.
endef

MAKE_FLAGS+= \
	AUDIO="portaudio" \
	DATADIR="/usr/share/espeak" \
	CXXFLAGS="$(TARGET_CFLAGS)" \
	LDFLAGS="$(TARGET_LDFLAGS)" \

MAKE_PATH:=./src

ESPEAK:=espeak-data-mipsbe-1.48.04.tar.gz

# Distribution URL doesn't always have the correct version
# Using the OpenWrt mirror provides a stable version
define Download/espeakdata
  URL:=http://download.linino.org/sources/
  FILE:=$(ESPEAK)
  MD5SUM:=692d47970cce94cd125c0d8c8e3fe578
endef

# Fetch latest nodejs that works
# Yes, I know this is ugly
define Build/Prepare
    $(call Build/Prepare/Default)
	$(eval $(call Download,espeakdata))
	$(TAR) -xvf $(DL_DIR)/$(ESPEAK) -C $(PKG_BUILD_DIR)
endef

define Package/espeak/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/espeak $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libespeak.so.* $(1)/usr/lib/
endef

define Package/espeak-data/install
	$(INSTALL_DIR) $(1)/usr/share/espeak
	$(CP) $(PKG_BUILD_DIR)/espeak-mipsbe/* $(1)/usr/share/espeak
endef

$(eval $(call BuildPackage,espeak))
$(eval $(call BuildPackage,espeak-data))
