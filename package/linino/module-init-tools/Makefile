#
# Copyright (C) 2006-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=module-init-tools
PKG_VERSION:=3.16
PKG_RELEASE:=7

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@KERNEL/linux/utils/kernel/module-init-tools/
PKG_MD5SUM:=743d2511a639814fa428b82b9f659e4f

PKG_LICENSE:=GPL-2.0+
PKG_LICENSE_FILES:=COPYING
PKG_MAINTAINER:=Nicolas Thill <nico@openwrt.org>

PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/module-init-tools
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE+= tools for managing Linux kernel modules
  DEPENDS:=+libc +libstdcpp
endef

define Package/module-init-tools/description
	The Module-Init-Tools package contains programs for handling kernel modules in Linux kernels greater than or equal to version 2.5.47.
endef

CONFIGURE_ARGS += \
	--prefix=/usr \
	--disable-doc

define Package/module-init-tools/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/lsmod $(1)/usr/sbin

	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/{depmod,insmod,insmod.static,modinfo,modprobe,rmmod} $(1)/usr/sbin
endef

define Package/module-init-tools/preinst
#!/bin/sh
for x in insmod rmmod lsmod modprobe depmod modinfo; do
  [ -L "$${IPKG_INSTROOT}/usr/sbin/$$x" ] && rm -f "$${IPKG_INSTROOT}/usr/sbin/$$x"
done

for x in rmmod modprobe depmod; do
  [ -L "$${IPKG_INSTROOT}/usr/bin/$$x" ] && rm -f "$${IPKG_INSTROOT}/usr/bin/$$x"
done

exit 0
endef

define Package/module-init-tools/postinst
#!/bin/sh
if [ -x /usr/sbin/depmod ]; then
 	echo -e "\nUpdating module dependencies...\n"
	/usr/sbin/depmod
fi

exit 0
endef

define Package/module-init-tools/postrm
#!/bin/sh
for x in insmod rmmod lsmod modprobe depmod modinfo; do
  [ ! -L "$${IPKG_INSTROOT}/usr/sbin/$$x" ] && ln -sf ../../sbin/kmodloader /usr/sbin/$$x
done

for x in rmmod modprobe depmod; do
  /bin/busybox $$x -h 2>&1 | grep -q BusyBox && ln -sf ../../bin/busybox /usr/bin/$$x
done

exit 0
endef

$(eval $(call BuildPackage,module-init-tools))
