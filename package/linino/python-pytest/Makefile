#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-pytest
PKG_VERSION:=3.1.1
PKG_RELEASE:=7

PKG_SOURCE:=pytest-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/96/51/8fa6bdb9c80e21a90e162f6774da2506497ef0c92afae8ba654c3a5ce4c3/
PKG_MD5SUM:=dfb110518cacc5b26ec5dd79877feb16

PKG_BUILD_DIR:=$(BUILD_DIR)/pytest-$(PKG_VERSION)

PKG_BUILD_DEPENDS:=python python-setuptools-scm

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-pytest
  SECTION:=language-python
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Simple powerful testing with Python
  DEFAULT:=m
  URL:=https://github.com/pytest-dev/pytest.git
  DEPENDS:=+python +python-light +python-setuptools-scm
endef

define Package/python-pytest/description
	The pytest framework makes it easy to write small tests, yet scales to support complex functional testing
endef

define Build/Compile
	$(call Build/Compile/PyMod,,install --prefix=/usr --root=$(PKG_INSTALL_DIR))
endef

define Package/python-pytest/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(1)$(PYTHON_PKG_DIR)
endef

$(eval $(call BuildPackage,python-pytest))
