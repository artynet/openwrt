#
# Copyright (C) 2007-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=avahi-daemon-service-arduino
PKG_VERSION:=0.6.31
PKG_RELEASE:=12

PKG_MAINTAINER:=Ted Hess <thess@kitschensync.net>

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/avahi-daemon-service-arduino
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=IP Addresses and Names
  DEPENDS:=+avahi-nodbus-daemon
  TITLE:=Announce ARDUINO service
endef

define Package/avahi-daemon-service-arduino/description
 This package contains the avahi service definition for announcing ARDUINO service.
endef

define Package/avahi-daemon-service-arduino/conffiles
/etc/avahi/services/arduino.service
endef

define Build/Compile
 # NOOP
endef

define Package/avahi-daemon-service-arduino/install
	$(INSTALL_DIR) $(1)/etc/avahi/services
	$(INSTALL_DATA) ./files/service-arduino $(1)/etc/avahi/services/arduino.service
endef

$(eval $(call BuildPackage,avahi-daemon-service-arduino))
