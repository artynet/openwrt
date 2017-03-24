#
# Copyright (C) 2016 Arduino Srl
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=arduino-files
PKG_VERSION:=1.8.2
PKG_RELEASE:=1

PKG_SOURCE_URL:=http://download.arduino.org/IDE/$(PKG_VERSION)/
PKG_SOURCE:=arduino-$(PKG_VERSION)-linux32.tar.xz
PKG_MD5SUM:=d284f3079632fa3d95caefe534fdc1cf

PKG_BUILD_DIR:=$(BUILD_DIR)/arduino-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/arduino-files
	SECTION:=devel
	CATEGORY:=Development
	TITLE:=Configuration Files for Arduino IDE
	DEPENDS:=+libc +libstdcpp
endef

define Package/arduino-files/description
	Configuration Files for Arduino IDE
endef

define Build/Prepare
	$(TAR) xvf $(DL_DIR)/$(PKG_SOURCE) -C $(PKG_BUILD_DIR) --strip-components=1
	$(RM) -rf $(PKG_BUILD_DIR)/hardware/tools $(PKG_BUILD_DIR)/lib
endef

define Build/Configure
	# NOOP
endef

define Build/Compile
	# NOOP
endef

define Package/arduino-files/install
	$(INSTALL_DIR) $(1)/opt/arduino

	$(CP) -r $(PKG_BUILD_DIR)/{hardware,libraries,examples} $(1)/opt/arduino
endef

define Package/arduino-files/preinst
#!/bin/sh
# check if we are on a real system
if [ ! -d /opt/arduino ]
then
	mkdir -p /opt/arduino
fi
endef

define Package/arduino-files/postrm
#!/bin/sh
# check if we are on a real system
if [ -d /opt/arduino ]
then
	rm -rvf /opt/arduino
fi
endef

$(eval $(call BuildPackage,arduino-files))
