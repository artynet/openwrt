#
# Copyright (C) 2011 David Kuehling <dvdkhlng TA gmx TOD de>
#
# License GPLv2 or later.  NO WARRANTY.
#
# OpenWRT package for the GNU Octave
#
# todo: how do we enable octave's internal help system?
#
# todo: we may have a (slight) linking problem: it prefers liboctinterp.so &
# friends from staging_dir/target-mipsel_uClibc-0.9.32/usr/lib/ over the one
# freshly compiled.  As a workaround, try 'rm
# openwrt-xburst/staging_dir/target-mipsel_uClibc-0.9.32/usr/lib/*oct*' if
# compilation fails for you.  Mostly that doesn't matter on clean rebuilds
# anyways.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=octave4
PKG_VERSION:=4.0.1
PKG_RELEASE:=8
PKG_SOURCE:=octave-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.octave.org/pub/gnu/octave/
# PKG_MD5SUM:=90c39fa9e241ad2e978bcee4682a2ba9
PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

PKG_FIXUP:=libtool autoreconf
PKG_REMOVE_FILES:=

PKG_BUILD_DIR:=$(BUILD_DIR)/octave-$(PKG_VERSION)

PKG_BUILD_DEPENDS:= @INSTALL_GFORTRAN +GraphicsMagick

#include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/octave4/Default
  SUBMENU:=Octave4
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=GNU Octave v4
  URL:=http://www.gnu.org/software/octave/
endef

define Package/octave4/Default/description
GNU Octave is a high-level language, primarily intended for numerical
computations. It provides a convenient command line interface for solving
linear and nonlinear problems numerically, and for performing other numerical
experiments using a language that is mostly compatible with Matlab. It may
also be used as a batch-oriented language.
endef

# todo: graphicsmagick package from multimedia feed is not complete.  We need
# the Magick++ library and the Magick++-config script installed.
define Package/octave4
$(call Package/octave4/Default)
  DEPENDS:= +libltdl +zlib +libpcre +libncurses +libreadline +libgfortran \
	+octave4-data +libpthread +libstdcpp +liblapack +GraphicsMagick
#+fftw3
#+GraphicsMagick
  TITLE+= (executable)
endef

define Package/octave4/description
$(call Package/octave4/Default/description)
 This package contains the Octave executable files
endef

define Package/octave4-data
$(call Package/octave4/Default)
  TITLE+= (function files)
endef

define Package/octave4-data/description
$(call Package/octave4/Default/description)
 This package contains the platform-independant .m-files.
endef

# fftw contains a lots of code.  not much use for soft-float anyways.  try to
# keep memory low and go without fftw (using smaller fftpack instead).
# todo: verify how much RAM that actually safes
# todo : need -enable-rpath?

OCTAVE_LIB_DIR := /usr/lib

# ugly workaround for octave 3.2.4 to compile with latest openwrt toolchain
TARGET_CXXFLAGS += -include stddef.h -fpermissive

CONFIGURE_ARGS += --without-opengl \
	--without-fftw --disable-docs \
	--without-curl --disable-gui \
	--disable-docs --disable-java \
	--enable-cross-tools --with-x=no \
	--without-framework-carbon \
	--without-framework-opengl

CONFIGURE_VARS += octlibdir=$(OCTAVE_LIB_DIR) FFLAGS="$(TARGET_CFLAGS)"
#MAKE_FLAGS += "LD=$(TARGET_CROSS)gcc -nostdlib"

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default)
endef

# octave emits warnings "timestamp in the future" that cannot be suppressed
# early in the startup-process.  Give early as possible timestamps so we don't
# see that warning.
OCTAVE_SANITIZE_TIMESTAMPS := touch --date="Jan 01 01:00:00 AM CET 1970"

define Build/Install
	$(call Build/Install/Default)
	$(INSTALL_DIR) $(PKG_INSTALL_DIR)/usr/share/octave/site/m/startup
	$(INSTALL_DATA) ./files/octaverc \
		$(PKG_INSTALL_DIR)/usr/share/octave/site/m/startup/
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/octave-$(PKG_VERSION)/octave
	$(CP) $(PKG_INSTALL_DIR)/usr/include/octave-$(PKG_VERSION)/octave/*.h \
		$(1)/usr/include/octave-$(PKG_VERSION)/octave/

	$(INSTALL_DIR) $(1)/usr/lib/octave
	$(INSTALL_DIR) $(1)$(OCTAVE_LIB_DIR)
	$(CP) -r $(PKG_INSTALL_DIR)/usr/lib/octave/* \
		$(1)/usr/lib/octave/
	$(CP) $(PKG_INSTALL_DIR)$(OCTAVE_LIB_DIR)/* \
		$(1)$(OCTAVE_LIB_DIR)/

	$(INSTALL_DIR) $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/octave-config-$(PKG_VERSION) \
		$(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mkoctfile-$(PKG_VERSION) \
		$(1)/usr/bin/
	$(SED) 's;\(DEFAULT_[A-Z]*DIR="\)/usr;\1$(STAGING_DIR)/usr;g' \
		$(1)/usr/bin/mkoctfile-$(PKG_VERSION)
	$(LN) mkoctfile-$(PKG_VERSION) $(1)/usr/bin/mkoctfile
	$(LN) octave-config-$(PKG_VERSION) $(1)/usr/bin/octave-config
endef

define Package/octave4/install
	$(INSTALL_DIR) $(1)/usr
	cp -r $(PKG_INSTALL_DIR)/usr/{bin,lib} $(1)/usr
	find $(1)/usr/lib -name "*.oct" -type f | \
		xargs $(OCTAVE_SANITIZE_TIMESTAMPS)
endef

define Package/octave4-data/install
	$(INSTALL_DIR) $(1)/
	(cd $(PKG_INSTALL_DIR)/ && tar -cf - usr/share) \
	    | (cd $(1)/ && tar -xvf -)
	find $(1)/usr/share -name "*.m" -type f | \
		xargs $(OCTAVE_SANITIZE_TIMESTAMPS)
endef

#$(eval $(call HostBuild))
$(eval $(call BuildPackage,octave4))
$(eval $(call BuildPackage,octave4-data))


# The following comments configure the Emacs editor.  Just ignore them.
# Local Variables:
# compile-command: "make -C ~/h/src/qi/openwrt-xburst package/octave/compile -j2 V=99"
# End:
