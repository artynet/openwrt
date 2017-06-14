#
# Copyright (C) 2016 Arduino Srl
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=arduino-primotest-one
PKG_VERSION:=1.0.0
PKG_RELEASE:=9

include $(INCLUDE_DIR)/package.mk

define Package/arduino-primotest-one
	SECTION:=devel
	CATEGORY:=Development
	TITLE:=Test Files for Arduino Primo - Phase 1
	DEPENDS:=+libc +libstdcpp +git +python +python-pyserial +kmod-usb-serial-ftdi
endef

define Package/arduino-primotest-one/description
	Test Files for Arduino Primo - Phase 1
endef

define Build/Configure
	# NOOP
endef

define Build/Compile
	# NOOP
endef

define Package/arduino-primotest-one/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/root/primoTest/BIN
	$(INSTALL_DIR) $(1)/root/primoTest

	$(INSTALL_BIN) ./files/sh/flash-stm32-nrf $(1)/usr/bin
	$(INSTALL_BIN) ./files/sh/reset-button-stm32-nrf $(1)/root/primoTest
	$(INSTALL_BIN) ./files/sh/reset-original $(1)/root/primoTest
	$(INSTALL_BIN) ./files/sh/install_test_part1.sh $(1)/root/primoTest
	$(CP) ./files/fw/{*.bin,*.hex} $(1)/root/primoTest/BIN
endef

define Package/arduino-primotest-one/postinst
#!/bin/sh
# check if we are on a real system
cp /root/primoTest/reset-button-stm32-nrf /etc/rc.button/reset

# cloning esptool
cd /root/primoTest
git clone git://github.com/espressif/esptool.git
endef

define Package/arduino-primotest-one/prerm
#!/bin/sh
# check if we are on a real system
if [ -f /root/primoTest/reset-original ]
then
	cp /root/primoTest/reset-original /etc/rc.button/reset
fi
endef

define Package/arduino-primotest-one/postrm
#!/bin/sh
# check if we are on a real system
if [ -d /root/primoTest ]
then
	rm -rvf /root/primoTest
fi
endef

$(eval $(call BuildPackage,arduino-primotest-one))
