#
# Copyright (C) 2007-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

# Make sure to also update the dbus-x package
PKG_NAME:=dbus-git
PKG_VERSION:=1.11.8
PKG_RELEASE:=1

# PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
# PKG_SOURCE_URL:=http://dbus.freedesktop.org/releases/dbus/
# PKG_MD5SUM:=fdb03ad2f2861a171fe7d0caad3b415f

PKG_REVISION:=2ebcebf2e52266e99baee4c4d9d9a54ff6c12feb
PKG_SOURCE_VERSION=$(PKG_REVISION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_URL:=git://anongit.freedesktop.org/dbus/dbus
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REVISION).tar.gz

PKG_MAINTAINER:=Steven Barth <cyrus@openwrt.org>
PKG_LICENSE:=AFL-2.1

PKG_FIXUP:=libtool autoreconf
PKG_REMOVE_FILES:=autogen.sh aclocal.m4

PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=1

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \

define Package/dbus-git/Default
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Simple interprocess messaging system (GIT)
  URL:=http://dbus.freedesktop.org/
endef

define Package/dbus-git/Default/description
 D-Bus is a message bus system, a simple way for applications to talk to one
 another. In addition to interprocess communication, D-Bus helps coordinate
 process lifecycle; it makes it simple and reliable to code a "single instance"
 application or daemon, and to launch applications and daemons on demand when
 their services are needed.
endef

define Package/libdbus-git
$(call Package/dbus-git/Default)
  CATEGORY:=Libraries
  TITLE+= (library)
  DEPENDS:= +libpthread
endef

define Package/libdbus-git/Description
$(call Package/dbus-git/Default/description)
 This package contains the D-Bus shared library.
endef

define Package/dbus-git
$(call Package/dbus-git/Default)
 TITLE+= (daemon)
 DEPENDS:= +libexpat +libdbus-git
endef

define Package/dbus-git/Description
$(call Package/dbus-git/Default/description)
 This package contains the D-Bus daemon.
endef

define Package/dbus-utils-git
$(call Package/dbus-git/Default)
 TITLE+= (utilities)
 DEPENDS:= dbus-git
endef

define Package/dbus-utils-git/Description
$(call Package/dbus-git/Default/description)
 This package contains D-Bus utilities.
endef

# define Build/Prepare
# 	$(Build/Prepare/Default)
# 	$(SED) 's/-Wl,--gc-sections/--gc-sections/' $(PKG_BUILD_DIR)/configure
# endef

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \
	--disable-abstract-sockets \
	--disable-ansi \
	--disable-asserts \
	--disable-console-owner-file \
	--disable-doxygen-docs \
	--disable-selinux \
	--disable-tests \
	--disable-verbose-mode \
	--disable-xml-docs \
	--with-dbus-user=root \
	--with-dbus-daemondir="/usr/sbin" \
	--with-system-socket="/var/run/dbus/system_bus_socket" \
	--with-system-pid-file="/var/run/dbus.pid" \
	--without-x \
	--libexecdir=/usr/lib/dbus-1

CONFIGURE_VARS+= \
	ac_cv_have_abstract_sockets="yes" \
	ac_cv_lib_expat_XML_ParserCreate_MM="yes" \

HOST_CONFIGURE_ARGS+= \
	--enable-shared \
	--enable-static \
	--disable-abstract-sockets \
	--disable-ansi \
	--disable-asserts \
	--disable-console-owner-file \
	--disable-docygen-docs \
	--disable-selinux \
	--disable-tests \
	--disable-verbose-mode \
	--disable-xml-docs \
	--with-dbus-user=root \
	--with-dbus-daemondir="$(STAGIND_DIR)/host/bin" \
	--with-system-socket="$(STAGING_DIR)/host/var/run/dbus/system_bus_socket" \
	--with-system-pid-file="$(STAGING_DIR)/host/var/run/dbus.pid" \
	--without-x \
	--libexecdir="$(STAGING_DIR)/host/lib/dbus-1"

HOST_CONFIGURE_VARS+= \
	ac_cv_have_abstract_sockets="yes" \
	ac_cv_lib_expat_XML_ParserCreate_MM="yes" \

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/dbus-1.0 \
		$(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib/dbus-1.0/include/dbus/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/dbus-1.0/include/dbus/*.h \
		$(1)/usr/lib/dbus-1.0/include/dbus/

	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/libdbus-1.{so*,la,a} \
		$(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/dbus-1.0 \
		$(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/dbus-1.pc \
		$(1)/usr/lib/pkgconfig/
endef

define Package/dbus-git/conffiles
/etc/dbus-1/session.conf
/etc/dbus-1/system.conf
endef

define Package/libdbus-git/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libdbus-1.so.* \
		$(1)/usr/lib/
endef

define Package/dbus-git/install
	$(INSTALL_DIR) $(1)/usr/share
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/dbus-1 \
		$(1)/usr/share/

	$(INSTALL_DIR) $(1)/usr/lib/dbus-1
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/lib/dbus-1/dbus-daemon-launch-helper \
		$(1)/usr/lib/dbus-1/

	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/sbin/dbus-daemon \
		$(1)/usr/sbin/

	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/dbus-uuidgen \
		$(1)/usr/bin/

	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/dbus-launch \
		$(1)/usr/bin/dbus-launch.real
	$(INSTALL_BIN) \
		./files/dbus-launch \
		$(1)/usr/bin/

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) \
		./files/dbus.init \
		$(1)/etc/init.d/dbus
endef

define Package/dbus-utils-git/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/dbus-{send,monitor,cleanup-sockets} \
		$(1)/usr/bin/
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,libdbus-git))
$(eval $(call BuildPackage,dbus-git))
$(eval $(call BuildPackage,dbus-utils-git))
