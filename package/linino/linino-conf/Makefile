#
# Copyright (c) 2015 Dog Hunter AG. All right reserved.
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=linino-conf
PKG_VERSION:=1.1
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/linino-conf
  SECTION:=utils
  CATEGORY:=Base system
  TITLE:=Custom Linino configurations
  DEPENDS:=+avahi-daemon-service-http +base-files
endef

define Package/linino-conf/conffiles
/etc/avahi/services/arduino.service
/etc/config/firewall
/etc/config/system
/etc/config/network
/etc/config/uhttpd
/etc/banner
/etc/inittab
/etc/rc.local
/etc/shadow
/etc/httpd.conf
endef

define Build/Compile
	# NOOP
endef

define Package/linino-conf/install
	$(INSTALL_DIR) $(1)/etc/avahi/services
	$(INSTALL_DIR) $(1)/etc/arduino
	$(INSTALL_DIR) $(1)/etc/linino
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DIR) $(1)/etc/triggerhappy/triggers.d
	
	# /etc/avahi DIR
	$(INSTALL_CONF) ./files/etc/avahi/services/http.service $(1)/etc/avahi/services/
	
	# /etc/triggerhappy DIR
	$(INSTALL_CONF) ./files/etc/triggerhappy/triggers.d/reset.conf $(1)/etc/triggerhappy/triggers.d/

	# /etc/ DIR
	$(INSTALL_CONF) ./files/etc/banner $(1)/etc/
	$(INSTALL_CONF) ./files/etc/inittab $(1)/etc/
	$(INSTALL_CONF) ./files/etc/rc.local $(1)/etc/
	$(INSTALL_CONF) ./files/etc/shadow $(1)/etc/
	$(INSTALL_CONF) ./files/etc/httpd.conf $(1)/etc/
	$(INSTALL_CONF) ./files/etc/fw_env.config $(1)/etc/

	# /etc/config DIR
	$(INSTALL_CONF) ./files/etc/config/firewall $(1)/etc/config/
	$(INSTALL_CONF) ./files/etc/config/system $(1)/etc/config/
	$(INSTALL_CONF) ./files/etc/config/uhttpd $(1)/etc/config/
	
	# /etc/arduino DIR
	$(INSTALL_DATA) ./files/etc/arduino/Caterina-Yun.hex $(1)/etc/arduino/
	$(INSTALL_DATA) ./files/etc/arduino/Caterina-Yun-Mini.hex $(1)/etc/arduino/
	$(INSTALL_DATA) ./files/etc/arduino/Caterina-One.hex $(1)/etc/arduino/
	$(INSTALL_DATA) ./files/etc/arduino/Caterina-Lei.hex $(1)/etc/arduino/
	$(INSTALL_DATA) ./files/etc/arduino/Caterina-Chiwawa.hex $(1)/etc/arduino/
	$(INSTALL_DATA) ./files/etc/arduino/linino-arduino-release $(1)/etc/arduino/
	$(INSTALL_DATA) ./files/etc/arduino/gpg_gen_key_batch $(1)/etc/arduino/
	$(INSTALL_DATA) ./files/etc/arduino/wifi_timezones.csv.gz $(1)/etc/arduino/
	$(INSTALL_DATA) ./files/etc/arduino/wifi_error_statuses.csv.gz $(1)/etc/arduino/
	$(INSTALL_DATA) ./files/etc/arduino/wifi_error_reasons.csv.gz $(1)/etc/arduino/
	$(INSTALL_DATA) ./files/etc/arduino/optiboot_atmega328.hex $(1)/etc/arduino/
	
	# /etc/linino DIR
	$(INSTALL_DATA) ./files/etc/linino/prog_console.sh $(1)/etc/linino/
	$(INSTALL_DATA) ./files/etc/linino/test_avrdude.sh $(1)/etc/linino/
	$(INSTALL_DATA) ./files/etc/linino/FirmataSPI.hex $(1)/etc/linino/
	$(INSTALL_DATA) ./files/etc/linino/LininoOneSerialTerminal.hex $(1)/etc/linino
	$(INSTALL_DATA) ./files/etc/linino/YunSerialTerminal.hex $(1)/etc/linino/
	$(INSTALL_DATA) ./files/etc/linino/LeiSerialTerminal.hex $(1)/etc/linino/
	$(INSTALL_DATA) ./files/etc/linino/YunMiniSerialTerminal.hex $(1)/etc/linino/
	$(INSTALL_DATA) ./files/etc/linino/ChiwawaSerialTerminal.hex $(1)/etc/linino/
	$(INSTALL_DATA) ./files/etc/linino/mips-onoff-tian.hex $(1)/etc/linino/

	# /etc/linino DIR (bathos firmware)
	$(INSTALL_DATA) ./files/etc/linino/bathos-one.hex $(1)/etc/linino
	$(INSTALL_DATA) ./files/etc/linino/bathos-yun.hex $(1)/etc/linino/
	$(INSTALL_DATA) ./files/etc/linino/bathos-lei.hex $(1)/etc/linino/
	$(INSTALL_DATA) ./files/etc/linino/bathos-yun-mini.hex $(1)/etc/linino/
	$(INSTALL_DATA) ./files/etc/linino/bathos-chiwawa.hex $(1)/etc/linino/
	$(INSTALL_DATA) ./files/etc/linino/bathos-tian.bin $(1)/etc/linino/
	$(INSTALL_DATA) ./files/etc/linino/fuses.txt $(1)/etc/linino/
	$(INSTALL_DATA) ./files/etc/linino/LININO_CONTRIBUTORS.txt $(1)/etc/linino/
endef

$(eval $(call BuildPackage,linino-conf))
