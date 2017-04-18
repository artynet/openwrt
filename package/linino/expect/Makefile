
# Copyright (C) 2008-2012 OpenWrt.org
#
# This is free software, licenmake under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=expect
PKG_VERSION:=5.45
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/expect
PKG_MD5SUM:=44e1a4f4c877e9ddc5a542dfa7ecc92b

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)$(PKG_VERSION)

PKG_BUILD_DEPENDS:=tcl tcl/host

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

CONFIGURE_ARGS += \
	--prefix=/usr \
	--with-tcl=$(STAGING_DIR)/usr/lib

define Package/expect
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libc +libstdcpp +tcl
  TITLE:=Expect is a tool for automating interactive applications
  URL:=http://sourceforge.net/projects/expect
endef

define Package/expect/description
    Expect is a tool for automating interactive applications such as telnet, ftp, passwd, fsck, rlogin, tip, etc.
	Expect really makes this stuff trivial. Expect is also useful for testing these same applications.
	And by adding Tk, you can also wrap interactive applications in X11 GUIs.

	Expect can make easy all sorts of tasks that are prohibitively difficult with anything else. You will find that
	Expect is an absolutely invaluable tool - using it, you will be able to automate tasks that you've never even
	thought of before - and you'll be able to do this automation quickly and easily.
endef

define Build/Prepare
	$(Build/Prepare/Default)
	(cd $(PKG_BUILD_DIR) && autoconf configure.in > configure)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		TCLLIBPATH=$(STAGING_DIR)/usr/lib \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		SCRIPTS="" all
endef

define Package/expect/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/expect $(1)/usr/bin/

	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/expect$(PKG_VERSION)/libexpect$(PKG_VERSION).so $(1)/usr/lib/
endef

$(eval $(call BuildPackage,expect))
