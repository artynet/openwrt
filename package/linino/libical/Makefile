#
# Copyright (C) 2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libical
PKG_VERSION:=1.0.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/libical/libical/releases/download/v$(PKG_VERSION)/

#PKG_SOURCE_URL:=git://gitorious.org/libical/mainline.git
#PKG_SOURCE_VERSION:=2e1c0fc5a8f5e41886141a6b402d00db735ccf49

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/libical
  TITLE:=Free open source implementation of the Object Exchange (OBEX) protocol.
  SECTION:=libs
  DEFAULT:=m
  CATEGORY:=Libraries
  DEPENDS:=+libpthread +libc +libstdcpp +perl
  URL:=https://gitorious.org/libical
endef

CMAKE_OPTIONS = \
        -DCMAKE_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DSHARED_ONLY=yes		

define Build/InstallDev
	$(INSTALL_DIR) \
		$(1)/usr/include \
		$(1)/usr/lib \
		$(1)/usr/lib/pkgconfig/

	$(CP) $(PKG_INSTALL_DIR)/usr/include/ical.h $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libical $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libical.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libical/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib* $(1)/usr/lib/
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,libical))
