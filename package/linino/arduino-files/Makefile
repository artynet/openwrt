#
# Copyright (C) 2014 Dog Hunter AG
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=arduino-files
PKG_VERSION:=1.7.11
PKG_RELEASE:=5

PKG_SOURCE_URL:=http://download.linino.org/pkg-src/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
# PKG_MD5SUM:=c95bc7be21194949e18d9b453a4211f4

PKG_FILE:="$(STAGING_DIR)/pkginfo/libc.provides"
PKG_CAT=`cat $(PKG_FILE) | grep libc.so.6`
PKG_CATM=`cat $(PKG_FILE) | grep libm.so.6`

include $(INCLUDE_DIR)/package.mk

define Package/arduino-files
	SECTION:=devel
	CATEGORY:=Development
	TITLE:=Configuration Files for Arduino IDE
	DEPENDS:=+zlib +libstdcpp +libc +libm
endef

define Package/arduino-files/description
	Configuration Files for Arduino IDE
endef

define Build/Prepare
    (if [ ! $(PKG_CAT) ];then echo "libc.so.6" >> $(PKG_FILE); fi)
	(if [ ! $(PKG_CATM) ];then echo "libm.so.6" >> $(PKG_FILE); fi)
	mkdir -p $(PKG_BUILD_DIR)/temp
	/bin/tar xvf $(DL_DIR)/$(PKG_SOURCE) -C $(PKG_BUILD_DIR)/temp --strip-components=1
endef

define Build/Configure
	# NOOP
endef

define Build/Compile
	# NOOP
endef

define Package/arduino-files/install
	$(INSTALL_DIR) $(1)/opt/arduino

	$(CP) -av $(PKG_BUILD_DIR)/temp/* $(1)/opt/arduino
endef

define Package/arduino-files/preinst
#!/bin/sh
# check if we are on a real system
if [ ! -d /opt/arduino ]
then
	mkdir -p /opt/arduino
fi
endef

define Package/arduino-files/postrm
#!/bin/sh
# check if we are on a real system
if [ -d /opt/arduino ]
then
	rm -rvf /opt/arduino
fi
endef

$(eval $(call BuildPackage,arduino-files))
