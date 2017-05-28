#
# Copyright (C) 2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=lora-gateway
PKG_VERSION:=5.0.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Lora-net/lora_gateway.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=v5.0.1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz

PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

# PKG_INSTALL:=1

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/lora-gateway/Default
	TITLE:=Semtech lora-gateway package
	URL:=http://www.semtech.com/wireless-rf/lora.html
endef

define Package/lora-gateway
$(call Package/lora-gateway/Default)
	SECTION:=net
	CATEGORY:=Network
	DEPENDS:=+libc +librt
	SUBMENU:=LoRa
endef

define Package/lora-gateway/description
	lora-gateway is a library to build a gateway based on
	a Semtech LoRa multi-channel RF receiver (a.k.a. concentrator).
endef

define Package/lora-gateway/config
	menu "LoRa Tweaks"

	config LORA_DEBUG
		bool "enable LoRa components debug"
		default y

	endmenu
endef

TARGET_CFLAGS += $(FPIC) -O2 -Wall -Wextra -std=gnu99 -Iinc -I. -lm

LORA_MAKEOPTS= $(MAKE_FLAGS) \
	$(MAKE_VARS) \
	-C $(PKG_BUILD_DIR)

# ifeq ($(CONFIG_LORA_DEBUG),y)
# 	$(SED) "s/0/1/g" $(PKG_BUILD_DIR)/libloragw/library.cfg
# endif

ifeq ($(CONFIG_LORA_DEBUG),y)
  define Build/Compile/loradebug
	$(SED) 's/0/1/g' $(PKG_BUILD_DIR)/libloragw/library.cfg
	$(MAKE) $(LORA_MAKEOPTS)
  endef
endif

ifeq ($(CONFIG_LORA_DEBUG),)
  define Build/Compile/loranodebug
	$(MAKE) $(LORA_MAKEOPTS)
  endef
endif

define Build/Compile
	$(call Build/Compile/loradebug)
	$(call Build/Compile/loranodebug)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/lora-gateway
	$(CP) $(PKG_BUILD_DIR)/libloragw/inc/* $(1)/usr/include/lora-gateway
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libloragw/libloragw.a $(1)/usr/lib/
endef

define Package/lora-gateway/install
	$(INSTALL_DIR) $(1)/lib/udev/rules.d
	$(INSTALL_DATA) ./files/82-arduino-lora-shield-acm.rules $(1)/lib/udev/rules.d

	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/libloragw/test* $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/util_pkt_logger/util_pkt_logger $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/util_spi_stress/util_spi_stress $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/util_tx_continuous/util_tx_continuous $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/util_tx_test/util_tx_test $(1)/usr/bin/util_tx_test_lora
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/util_lbt_test/util_lbt_test $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/util_spectral_scan/util_spectral_scan $(1)/usr/bin

	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/libloragw/libloragw.a $(1)/usr/lib
endef

define Package/lora-gateway/postinst
#!/bin/sh
# check if we are on real system
if [ -z "$${IPKG_INSTROOT}" ]; then
        echo "Refreshing udev rules..."
        udevadm control --reload-rules
		udevadm trigger
fi
exit 0
endef

$(eval $(call BuildPackage,lora-gateway))
