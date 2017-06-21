#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-hologram
PKG_VERSION:=0.5.15
PKG_RELEASE:=1

PKG_REVISION:=v$(PKG_VERSION)

PKG_SOURCE_PROTO:=git

PKG_SOURCE:=$(PKG_NAME)-$(PKG_REVISION).tar.gz
PKG_SOURCE_URL:=https://github.com/hologram-io/hologram-python.git
PKG_SOURCE_VERSION:=$(PKG_REVISION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-hologram
  SECTION:=language-python
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Hologram Python SDK
  DEFAULT:=m
  URL:=https://github.com/hologram-io/hologram-python.git
  DEPENDS:=+python +python-light +python-pyserial +python-pppd +python-wifi +python-hjson +python-pytest +python-sdk-auth
endef

define Package/python-hologram/description
	Hologram Python SDK - Send messages to the cloud in just 3 lines of code!
endef

define Build/Compile
	$(call Build/Compile/PyMod,,install --prefix=/usr --root=$(PKG_INSTALL_DIR))
endef

define Package/python-hologram/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(1)$(PYTHON_PKG_DIR)

	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/hologram $(1)/usr/bin

	$(INSTALL_DIR) $(1)/lib/udev/rules.d
	$(INSTALL_DATA) ./files/83-ublox-iota.rules $(1)/lib/udev/rules.d
endef

define Package/python-hologram/postinst
#!/bin/sh
# check if we are on real system
if [ -z "$${IPKG_INSTROOT}" ]; then
        echo "Refreshing udev rules..."
        udevadm control --reload-rules
		udevadm trigger
fi
exit 0
endef

define Package/python-hologram/postrm
#!/bin/sh
# check if we are on real system
if `grep -qs '/opt' /proc/mounts`
then
	PREFIX="/opt/usr"
else
	PREFIX="/usr"
fi

for q in Exceptions Hologram hologram_python-$(PKG_VERSION)-py2.7.egg-info scripts; do
	rm -rf $$PREFIX/lib/python2.7/site-packages/$$q
done
exit 0
endef

$(eval $(call BuildPackage,python-hologram))
