
# Copyright (C) 2008-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=sed-git
PKG_VERSION:=4.2.x
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git

PKG_REVISION:=6e760c0b4d52923638354c5c634442ae38dae1e4
PKG_SOURCE_VERSION=$(PKG_REVISION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_URL:=git://git.sv.gnu.org/sed.git
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REVISION).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/sed-git
  SECTION:=devel
  CATEGORY:=Development
  DEPENDS:=+USE_EGLIBC:librt
  TITLE:=sed (git)
  URL:=http://www.gnu.org/software/sed/
endef

define Package/sed-git/description
	The GNU sed utility (git)
endef

define Build/Prepare
	$(Build/Prepare/Default)
	(cd $(PKG_BUILD_DIR);./bootstrap --force --no-git --gnulib-srcdir=gnulib)
endef

#CONFIGURE_VARS += \
#	ac_cv_func_mempcpy=n \
#	gl_cv_func_wcwidth_works=yes \
#   ac_cv_func_fnmatch_gnu=yes

define Package/sed-git/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/sed $(1)/usr/bin/
endef

define Package/sed-git/preinst
#!/bin/sh
for x in sed; do
  [ -L "$${IPKG_INSTROOT}/usr/bin/$$x" ] && rm -f "$${IPKG_INSTROOT}/usr/bin/$$x"
done
exit 0
endef

define Package/sed-git/postrm
#!/bin/sh
for x in sed; do
  /bin/busybox $$x -h 2>&1 | grep -q BusyBox && ln -sf ../../bin/busybox /usr/bin/$$x
done
exit 0
endef

$(eval $(call BuildPackage,sed-git))
