#
# Copyright (c) 2015 Arduino Srl. All right reserved.
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=bonefish
PKG_REVISION:=2b8d8cd57e54310d2380164bd36003df55607c65
PKG_VERSION:=1.0
PKG_RELEASE:=2

PKG_SOURCE_PROTO:=git

PKG_SOURCE:=$(PKG_NAME)-$(PKG_REVISION).tar.gz
PKG_SOURCE_URL:=https://github.com/tplgy/bonefish.git
PKG_SOURCE_VERSION:=$(PKG_REVISION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_REVISION)

PKG_USE_MIPS16:=0

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_REVISION)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/bonefish
  SECTION:=utils
  DEFAULT:=m
  CATEGORY:=Utilities
  TITLE:=C++ WAMP application router that enables building applications from loosely-coupled components.
  DEPENDS:=+libc +libstdcpp +libasio +boost-libs +boost-test +librt +libopenssl
endef

define Package/bonefish/description
	C++ WAMP application router that enables building applications from loosely-coupled components.
endef

CMAKE_OPTIONS = \
    -DCMAKE_INSTALL_PREFIX=/usr

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/

	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
endef

define Package/bonefish/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/lib/

	$(CP) $(PKG_BUILD_DIR)/daemon/bonefish $(1)/usr/bin
	# $(CP) $(PKG_BUILD_DIR)/examples/integration $(1)/usr/bin

	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,bonefish))
