#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=speechtools
PKG_VERSION:=2.4
PKG_RELEASE:=2

PKG_SOURCE:=speech_tools-$(PKG_VERSION)-release.tar.gz
PKG_SOURCE_URL:=http://festvox.org/packed/festival/2.4/
# PKG_MD5SUM:=b7c3523b3bbc6f29ce61e6650cd9a428

PKG_FIXUP:=libtool autoreconf

PKG_BUILD_DIR:=$(BUILD_DIR)/speech_tools

PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/speechtools
  SECTION:=sound
  CATEGORY:=Sound
  DEPENDS:=+libc +libstdcpp +pulseaudio-daemon +libncurses
  TITLE:=Text-to-speech for embedded systems - complete
  URL:=http://festvox.org/speechtools/
endef

define Package/speechtools/description
	speechtools is the well-developed text-to-speech program written in C++.
	This program is written in C to keep memory usage low.
endef

define Build/Prepare
	$(Build/Prepare/Default)
	cp ./files/mips-openwrt-linux-uclibc-gcc.mak $(PKG_BUILD_DIR)/config/compilers
endef

EXE1:={ch_track,scfg_train,sigfilter,align,wfst_run,dp,spectgen,bcat,tilt_analysis,ols_test,scfg_test}
EXE2:={sig2fv,tilt_synthesis,viterbi,siod,wfst_build,ols,ngram_build,xml_parser,na_record,wfst_train,ch_lab}
EXE3:={pitchmark,pda,wagon,ch_wave,ch_utt,scfg_make,wagon_test,na_play,ngram_test,scfg_parse,design_filter}
EXE4:={raw_to_xgraph,est_gdb,cxx_to_docbook,pm,example_to_doc++,est_examples,resynth,est_program,tex_to_images,make_wagon_desc,build_docbook_index}

TARGET_LDFLAGS += -Wl,-rpath-link $(STAGING_DIR)/usr/lib/pulseaudio

CONFIGURE_ARGS += \
	--host=$(REAL_GNU_TARGET_NAME) \
	--target=$(REAL_GNU_TARGET_NAME) \
	--prefix=/usr

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) CC=$(TARGET_CC) CXX=$(TARGET_CXX) \
		DESTDIR="$(PKG_INSTALL_DIR)" $(MAKE_ARGS) all install
endef

define Package/speechtools/install
	$(INSTALL_DIR) $(1)/usr/bin

	$(INSTALL_BIN) $(PKG_BUILD_DIR)/main/$(EXE1) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/main/$(EXE2) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/main/$(EXE3) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/$(EXE4) $(1)/usr/bin
endef

$(eval $(call BuildPackage,speechtools))
