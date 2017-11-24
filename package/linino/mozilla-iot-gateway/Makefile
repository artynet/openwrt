#
# Copyright (C) 2016 Arduino Srl
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mozilla-iot-gateway
PKG_VERSION:=1.0
PKG_RELEASE:=3

PKG_REV:=a841e4f

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/mozilla-iot/gateway.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV)
PKG_SOURCE_VERSION=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)

include $(INCLUDE_DIR)/package.mk

define Package/mozilla-iot-gateway
	SECTION:=Network
	CATEGORY:=IoT
	TITLE:=Mozilla IoT Gateway
	DEPENDS:=+libc +libstdcpp +libopenzwave +openssl-util
endef

define Package/mozilla-iot-gateway/description
	Mozilla IoT Gateway
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)/build
	$(TAR) xvf $(DL_DIR)/$(PKG_SOURCE) -C $(PKG_BUILD_DIR)/build --strip-components=1
	## $(RM) -rf $(PKG_BUILD_DIR)/hardware/tools $(PKG_BUILD_DIR)/lib
endef

define Build/Configure
	# NOOP
endef

define Build/Compile
	# NOOP
endef

define Package/mozilla-iot-gateway/install
	$(INSTALL_DIR) $(1)/opt/mozilla-iot-gateway
	$(CP) -r $(PKG_BUILD_DIR)/build/* $(1)/opt/mozilla-iot-gateway

	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./files/mozilla-iot-run $(1)/usr/bin
endef

define Package/mozilla-iot-gateway/preinst
#!/bin/sh
# check if we are on a real system
if [ ! -d /opt/mozilla-iot-gateway ]
then
	mkdir -p /opt/mozilla-iot-gateway
fi
endef

define Package/mozilla-iot-gateway/postrm
#!/bin/sh
# check if we are on a real system
if [ -d /opt/mozilla-iot-gateway ]
then
	rm -rvf /opt/mozilla-iot-gateway
fi
endef

$(eval $(call BuildPackage,mozilla-iot-gateway))
