
# Copyright (C) 2008-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=sed
PKG_VERSION:=4.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=@GNU/sed
PKG_MD5SUM:=e0c583d4c380059abd818cd540fe6938

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/sed
  SECTION:=devel
  CATEGORY:=Development
  DEPENDS:=+USE_EGLIBC:librt +libacl
  TITLE:=sed
  URL:=http://www.gnu.org/software/sed/
endef

define Package/sed/description
	The GNU sed utility
endef

TARGET_CFLAGS += -std=c99

define Package/sed/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/sed $(1)/usr/bin/
endef

define Package/sed/preinst
#!/bin/sh
for x in sed; do
  [ -L "$${IPKG_INSTROOT}/usr/bin/$$x" ] && rm -f "$${IPKG_INSTROOT}/usr/bin/$$x"
done
exit 0
endef

define Package/sed/postrm
#!/bin/sh
for x in sed; do
  /bin/busybox $$x -h 2>&1 | grep -q BusyBox && ln -sf ../../bin/busybox /usr/bin/$$x
done
exit 0
endef

$(eval $(call BuildPackage,sed))
