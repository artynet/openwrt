#
# Copyright (c) 2013 OpenWRT All right reserved.
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=smartme-scripts
PKG_VERSION:=1.0
PKG_RELEASE:=6

include $(INCLUDE_DIR)/package.mk

define Package/smartme-scripts
  SECTION:=utils
  CATEGORY:=Base system
  TITLE:=Custom SmartME scripts
  DEPENDS:=+kmod-loop +wireless-tools +kmod-random-bcm2708
endef

define Build/Compile
	# NOOP
endef

define Package/smartme-scripts/install
	# install paths
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DIR) $(1)/etc/smartme

	# /etc
	$(INSTALL_DATA) ./files/etc/rc.local $(1)/etc

	# /etc/config
	$(INSTALL_DATA) ./files/etc/config/firewall $(1)/etc/config
	$(INSTALL_DATA) ./files/etc/config/network $(1)/etc/config
	$(INSTALL_DATA) ./files/etc/config/smartme $(1)/etc/config
	$(INSTALL_DATA) ./files/etc/config/wireless $(1)/etc/config

	# /etc/smartme
	$(INSTALL_DATA) ./files/etc/smartme/gpg_gen_key_batch $(1)/etc/smartme

	# /usr/bin
	$(INSTALL_BIN) ./files/usr/bin/blink-start $(1)/usr/bin
	$(INSTALL_BIN) ./files/usr/bin/blink-stop $(1)/usr/bin
	$(INSTALL_BIN) ./files/usr/bin/smartme-wifi-connect $(1)/usr/bin
	$(INSTALL_BIN) ./files/usr/bin/wifi-live-or-reset $(1)/usr/bin
	$(INSTALL_BIN) ./files/usr/bin/wifi-reload $(1)/usr/bin
	$(INSTALL_BIN) ./files/usr/bin/wifi-reset-and-reboot $(1)/usr/bin

	# /etc/init.d
	$(INSTALL_BIN) ./files/etc/init.d/generate_new_gpg_key $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc/init.d/handle_wifi_reset $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc/init.d/rename-wifi-if-access-point $(1)/etc/init.d
	# $(INSTALL_BIN) ./files/etc/init.d/start-bt $(1)/etc/init.d
endef

$(eval $(call BuildPackage,smartme-scripts))
