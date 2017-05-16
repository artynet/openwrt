#
# Copyright (C) 2016 Arduino Srl
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=arduino-files-17
PKG_VERSION:=1.7.11
PKG_RELEASE:=2

PKG_SOURCE_URL:=http://download.arduino.org/IDE/$(PKG_VERSION)/
PKG_SOURCE:=arduino-$(PKG_VERSION).org-linux32.tar.xz
PKG_MD5SUM:=6d3031792e6392b762e711e5ac648758

PKG_BUILD_DIR:=$(BUILD_DIR)/arduino-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/arduino-files-17
	SECTION:=devel
	CATEGORY:=Development
	TITLE:=Configuration Files for Arduino IDE v1.7.x
	DEPENDS:=+libc +libstdcpp
endef

define Package/arduino-files-17/description
	Configuration Files for Arduino IDE
endef

define Build/Prepare
	$(TAR) xvf $(DL_DIR)/$(PKG_SOURCE) -C $(PKG_BUILD_DIR) --strip-components=1
	$(RM) -rf $(PKG_BUILD_DIR)/lib
endef

define Build/Configure
	# NOOP
endef

define Build/Compile
	# NOOP
endef

define Package/arduino-files-17/install
	$(INSTALL_DIR) $(1)/opt/arduino-17
	$(INSTALL_DIR) $(1)/opt/arduino-17/hardware
	$(INSTALL_DIR) $(1)/opt/arduino-17/hardware/tools

	$(CP) -r $(PKG_BUILD_DIR)/hardware/arduino $(1)/opt/arduino-17/hardware
	$(CP) -r $(PKG_BUILD_DIR)/hardware/tools/CMSIS $(1)/opt/arduino-17/hardware/tools/CMSIS
	$(CP) -r $(PKG_BUILD_DIR)/{libraries,examples} $(1)/opt/arduino-17
endef

define Package/arduino-files-17/preinst
#!/bin/sh
# check if we are on a real system
if [ ! -d /opt/arduino-17 ]
then
	mkdir -p /opt/arduino-17
fi
endef

define Package/arduino-files-17/postrm
#!/bin/sh
# check if we are on a real system
if [ -d /opt/arduino-17 ]
then
	rm -rvf /opt/arduino-17
fi
endef

$(eval $(call BuildPackage,arduino-files-17))
