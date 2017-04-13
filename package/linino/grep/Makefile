#
# Copyright (C) 2010-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=grep
PKG_VERSION:=3.0
PKG_RELEASE:=4

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=@GNU/grep
PKG_MD5SUM:=fa07c1616adeb9c3262be5177d10ad4a

PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILES:=COPYING
PKG_MAINTAINER:=Julen Landa Alustiza <julen@zokormazo.info>

PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

TARGET_CFLAGS+=--std=gnu99

define Package/grep
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=grep search utility - full version
  DEPENDS:=+libpcre
  URL:=http://www.gnu.org/software/grep/
endef

define Package/grep/description
The grep command searches one or more input files for lines
containing a match to a specified pattern. By default, grep
prints the matching lines.
endef

define Package/grep/install
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/{grep,egrep,fgrep} $(1)/bin
endef

define Package/grep/preinst
#!/bin/sh
for x in grep egrep fgrep; do
  [ -L "$${IPKG_INSTROOT}/bin/$$x" ] && rm -f "$${IPKG_INSTROOT}/bin/$$x"
done
exit 0
endef

define Package/grep/postrm
#!/bin/sh
for x in grep egrep fgrep; do
  /bin/busybox $$x -h 2>&1 | grep -q BusyBox && ln -sf ../../bin/busybox /bin/$$x
done
exit 0
endef

$(eval $(call BuildPackage,grep))
