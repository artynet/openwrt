
# Copyright (C) 2008-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=findutils-git
PKG_VERSION:=4.6.x
PKG_RELEASE:=2

PKG_SOURCE_PROTO:=git

PKG_REVISION:=58faf1ac3922e401e6bdd5dc7bb6e879dab5894c
PKG_SOURCE_VERSION=$(PKG_REVISION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_URL:=git://git.sv.gnu.org/findutils.git
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REVISION).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/findutils-git
  SECTION:=devel
  CATEGORY:=Development
  DEPENDS:=+USE_EGLIBC:librt
  TITLE:=findutils (git)
  URL:=http://www.gnu.org/software/findutils/
endef

define Package/findutils-git/description
  The Findutils package contains programs that show the differences between
  files or directories.
endef

define Build/Prepare
	$(Build/Prepare/Default)
	(cd $(PKG_BUILD_DIR);./bootstrap --force --no-git --gnulib-srcdir=gnulib)
endef

CONFIGURE_VARS += \
	ac_cv_func_mempcpy=n \
	gl_cv_func_wcwidth_works=yes \
    ac_cv_func_fnmatch_gnu=yes \

define Package/findutils-git/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/{find,xargs,locate,updatedb} $(1)/usr/bin/

	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/frcode $(1)/usr/lib/
endef

define Package/findutils-git/preinst
#!/bin/sh
for x in find xargs locate updatedb; do
  [ -L "$${IPKG_INSTROOT}/usr/bin/$$x" ] && rm -f "$${IPKG_INSTROOT}/usr/bin/$$x"
done
exit 0
endef

define Package/findutils-git/postrm
#!/bin/sh
for x in find xargs locate updatedb; do
  /bin/busybox $$x -h 2>&1 | grep -q BusyBox && ln -sf ../../bin/busybox /usr/bin/$$x
done
exit 0
endef

$(eval $(call BuildPackage,findutils-git))
