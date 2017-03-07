include $(TOPDIR)/rules.mk

PKG_NAME:=ajtcl
PKG_VERSION:=16.04
PKG_RELEASE:=1
# PKG_MD5SUM:=44c61bff40b4114077ffa04d49c820c6

PKG_SOURCE_PROTO:=git
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-src.tar.gz
PKG_REVISION:=v16.04
PKG_SOURCE_URL:=https://git.allseenalliance.org/gerrit/core/ajtcl.git
PKG_SOURCE_VERSION:=$(PKG_REVISION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

# SCons supports parallel builds but does not support make's jobserver
PKG_BUILD_PARALLEL:=$(if $(CONFIG_PKG_BUILD_USE_JOBSERVER),0,1)

PKG_CONFIG_DEPENDS:= \
	CONFIG_DEBUG

include $(INCLUDE_DIR)/package.mk

define Package/ajtcl/Default
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpthread +librt
  URL:=http://www.allseenalliance.org
  MAINTAINER:=AllSeen Alliance <allseen-core@lists.allseenalliance.org>
  TITLE:=AllJoyn Thin Client Library
endef

define Package/ajtcl
$(call Package/ajtcl/Default)
endef

define Package/ajtcl/description
AllJoyn Thin Client Library is a basic, low-level C library for developing
ad hoc peer-to-peer applications that use the AllJoyn protocol.  This version
uses built-in cryptographic hash functions.
endef

define Package/ajtcl-samples
$(call Package/ajtcl/Default)
  TITLE+= - samples
  DEPENDS:=ajtcl
endef

define Package/ajtcl-samples/description
	Alljoyn Thin Client Library samples.  (This is primarily for testing.  Do not
	include in production builds.)
endef

define Package/ajtcl-tests
$(call Package/ajtcl/Default)
  TITLE+= - tests
  DEPENDS:=ajtcl
endef

define Package/ajtcl-tests/description
	Alljoyn Thin Client Library tests.  (This is primarily for testing.  Do not
	include in production builds.)
endef

ifeq ($(CONFIG_DEBUG),y)
  ALLJOYN_BUILD_VARIANT:=debug
else
  ALLJOYN_BUILD_VARIANT:=release
endif

define Build/Configure/Default
# Override default to do nothing
endef

TARGET_CFLAGS += -Wno-format-nonliteral -Wno-cast-align

define Build/Compile
	CROSS_CFLAGS="$(TARGET_CFLAGS) $(EXTRA_CFLAGS) $(TARGET_CPPFLAGS)" \
	CROSS_LINKFLAGS="$(TARGET_LINKFLAGS) $(TARGET_LDFLAGS)" \
	CROSS_PATH=$(TARGET_PATH) \
	CROSS_PREFIX=$(TARGET_CC:gcc=) \
	scons -C $(PKG_BUILD_DIR) \
		$(PKG_JOBS) \
		WS=off \
		TARG=linux \
		"VARIANT=$(ALLJOYN_BUILD_VARIANT)" \
		"AJ_CRYPTO=builtin"
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) -R $(PKG_BUILD_DIR)/dist/include/ajtcl $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/dist/lib/libajtcl.* $(1)/usr/lib/
	$(CP) $(PKG_BUILD_DIR)/dist/lib/libajtcl_services_config.* $(1)/usr/lib
endef

define Package/ajtcl/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/dist/lib/libajtcl.so $(1)/usr/lib/
	$(CP) $(PKG_BUILD_DIR)/dist/lib/libajtcl_services_config.{so,a} $(1)/usr/lib
endef

define Package/ajtcl-openssl/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/dist/lib/libajtcl.so $(1)/usr/lib/
endef

define Package/ajtcl-samples/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/dist/bin/{basic*,Secure*,signal*,eventaction_service,nameChange_client,net_bus} $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/dist/bin/services/* $(1)/usr/bin/
endef

define Package/ajtcl-tests/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/dist/test/* $(1)/usr/bin/
endef

$(eval $(call BuildPackage,ajtcl))
$(eval $(call BuildPackage,ajtcl-samples))
$(eval $(call BuildPackage,ajtcl-tests))
