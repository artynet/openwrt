#
# Copyright (C) 2016 Arduino Srl
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mozilla-iot-gateway-modules
PKG_VERSION:=1.0
PKG_RELEASE:=2

PKG_REV:=a841e4f

PKG_SOURCE_URL:=http://downloads.mozilla.org/
PKG_SOURCE:=node_modules-arm-uclibc-$(PKG_REV).tar.bz2
# PKG_MD5SUM:=d284f3079632fa3d95caefe534fdc1cf

include $(INCLUDE_DIR)/package.mk

define Package/mozilla-iot-gateway-modules
	SECTION:=Network
	CATEGORY:=IoT
	TITLE:=Binary node modules for Mozilla IoT Gateway
	DEPENDS:=+libc +libstdcpp +libopenzwave +mozilla-iot-gateway
endef

define Package/mozilla-iot-gateway-modules/description
	Binary node modules for Mozilla IoT Gateway
endef

define Build/Prepare
	$(TAR) xvf $(DL_DIR)/$(PKG_SOURCE) -C $(PKG_BUILD_DIR)
endef

define Build/Configure
	# NOOP
endef

define Build/Compile
	# NOOP
endef

define Package/mozilla-iot-gateway-modules/install
	$(INSTALL_DIR) $(1)/opt/mozilla-iot-gateway

	$(CP) -r $(PKG_BUILD_DIR)/node_modules $(1)/opt/mozilla-iot-gateway
endef

define Package/mozilla-iot-gateway-modules/postrm
#!/bin/sh
# check if we are on a real system
if [ -d /opt/mozilla-iot-gateway/node_modules ]
then
	rm -rvf /opt/mozilla-iot-gateway/node_modules
fi
endef

$(eval $(call BuildPackage,mozilla-iot-gateway-modules))
