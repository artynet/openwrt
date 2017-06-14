#
# Copyright (C) 2016 Arduino Srl
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=arduino-primotest-two
PKG_VERSION:=1.0.0
PKG_RELEASE:=7

include $(INCLUDE_DIR)/package.mk

define Package/arduino-primotest-two
	SECTION:=devel
	CATEGORY:=Development
	TITLE:=Test Files for Arduino Primo - Phase 2
	DEPENDS:=+libc +libstdcpp +python +python-pyserial +kmod-usb-serial-ftdi +neard +nfcst-utils
endef

define Package/arduino-primotest-two/description
	Test Files for Arduino Primo - Phase 2
endef

define Build/Configure
	# NOOP
endef

define Build/Compile
	# NOOP
endef

define Package/arduino-primotest-two/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/root/primoTest
	$(INSTALL_DIR) $(1)/root/primoTest/BIN

	$(INSTALL_BIN) ./files/sh/test-nrf-esp $(1)/usr/bin
	$(INSTALL_BIN) ./files/sh/set_your_network.sh $(1)/root/primoTest
	$(INSTALL_BIN) ./files/sh/reset-button-nrf-test $(1)/root/primoTest
	$(CP) ./files/fw/*.hex $(1)/root/primoTest/BIN
	$(CP) ./files/python/* $(1)/root/primoTest
endef

define Package/arduino-primotest-two/postinst
#!/bin/sh
# check if we are on a real system
cp /root/primoTest/reset-button-nrf-test /etc/rc.button/reset
endef

define Package/arduino-primotest-one/prerm
#!/bin/sh
# check if we are on a real system
if [ -f /root/primoTest/reset-original ]
then
	cp /root/primoTest/reset-original /etc/rc.button/reset
fi
endef

define Package/arduino-primotest-two/postrm
#!/bin/sh
# check if we are on a real system
if [ -d /root/primoTest ]
then
	rm -rvf /root/primoTest
fi
endef

$(eval $(call BuildPackage,arduino-primotest-two))
