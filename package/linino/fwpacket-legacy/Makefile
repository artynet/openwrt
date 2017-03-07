#
# Copyright (C) 2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=packet-forwarder-legacy
PKG_VERSION:=2.2.1
PKG_RELEASE:=6

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Lora-net/packet_forwarder.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=v2.2.1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz

PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

PKG_BUILD_DEPENS:=+lora-gateway-legacy

LORA_VERSION:=legacy-3.1.0

# PKG_INSTALL:=1

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/packet-forwarder-legacy/Default
	TITLE:=Semtech packet-forwarder-legacy package
	URL:=http://www.semtech.com/wireless-rf/lora.html
endef

define Package/packet-forwarder-legacy
$(call Package/packet-forwarder-legacy/Default)
	SECTION:=utils
	CATEGORY:=Utilities
	DEPENDS:=+libmpsse +libftdi +lora-gateway
	SUBMENU:=LoRa
	DEFAULT:=m
endef

define Package/packet-forwarder-legacy/description
	A LoRa packet forwarder is a program running on the host of a LoRa gateway
	that forwards RF packets receive by the concentrator to a server through a
	IP/UDP link, and emits RF packets that are sent by the server.
endef

TARGET_CFLAGS += $(FPIC) -O2 -Wall -Wextra -std=c99 -Iinc -I. -lm

define Build/Compile
	$(MAKE) CROSS_COMPILE=$(REAL_GNU_TARGET_NAME)- \
		LIBS="-lloragw -lrt -lpthread -lm -lmpsse" \
		CFLAGS+="-I$(PKG_BUILD_DIR)/basic_pkt_fwd/inc" \
		LGW_PATH=$(BUILD_DIR)/lora-gateway-$(LORA_VERSION)/libloragw -C $(PKG_BUILD_DIR)/basic_pkt_fwd
	#
	$(MAKE) CROSS_COMPILE=$(REAL_GNU_TARGET_NAME)- \
		LIBS="-lloragw -lrt -lpthread -lm -lmpsse" \
		CFLAGS+="-I$(PKG_BUILD_DIR)/beacon_pkt_fwd/inc" \
		LGW_PATH=$(BUILD_DIR)/lora-gateway-$(LORA_VERSION)/libloragw -C $(PKG_BUILD_DIR)/beacon_pkt_fwd
	#
	$(MAKE) CROSS_COMPILE=$(REAL_GNU_TARGET_NAME)- \
		LIBS="-lloragw -lrt -lpthread -lm -lmpsse" \
		CFLAGS+="-I$(PKG_BUILD_DIR)/gps_pkt_fwd/inc" \
		LGW_PATH=$(BUILD_DIR)/lora-gateway-$(LORA_VERSION)/libloragw -C $(PKG_BUILD_DIR)/gps_pkt_fwd
	#
	$(MAKE) CROSS_COMPILE=$(REAL_GNU_TARGET_NAME)- \
		LIBS="-lloragw -lrt -lpthread -lm -lmpsse" \
		CFLAGS+="-I$(PKG_BUILD_DIR)/util_ack/inc" \
		LGW_PATH=$(BUILD_DIR)/lora-gateway-$(LORA_VERSION)/libloragw -C $(PKG_BUILD_DIR)/util_ack
	#
	$(MAKE) CROSS_COMPILE=$(REAL_GNU_TARGET_NAME)- \
		LIBS="-lloragw -lrt -lpthread -lm -lmpsse" \
		CFLAGS+="-I$(PKG_BUILD_DIR)/util_sink/inc" \
		LGW_PATH=$(BUILD_DIR)/lora-gateway-$(LORA_VERSION)/libloragw -C $(PKG_BUILD_DIR)/util_sink
	#
	$(MAKE) CROSS_COMPILE=$(REAL_GNU_TARGET_NAME)- \
		LIBS="-lloragw -lrt -lpthread -lm -lmpsse" \
		CFLAGS+="-I$(PKG_BUILD_DIR)/util_tx_test/inc" \
		LGW_PATH=$(BUILD_DIR)/lora-gateway-$(LORA_VERSION)/libloragw -C $(PKG_BUILD_DIR)/util_tx_test
endef

define Package/packet-forwarder-legacy/install
	$(INSTALL_DIR) $(1)/usr/bin

	$(INSTALL_BIN) $(PKG_BUILD_DIR)/basic_pkt_fwd/basic_pkt_fwd $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/beacon_pkt_fwd/beacon_pkt_fwd $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/gps_pkt_fwd/gps_pkt_fwd $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/util_ack/util_ack $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/util_sink/util_sink $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/util_tx_test/util_tx_test $(1)/usr/bin
endef

$(eval $(call BuildPackage,packet-forwarder-legacy))
