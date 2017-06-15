#
# Copyright (C) 2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#-DCMAKE_INSTALL_PREFIX=/home/arturo/Scaricati/TARBALLS/lapack-3.6.0/build/install_temp -DBUILD_SHARED_LIBS=ON ../

include $(TOPDIR)/rules.mk

PKG_NAME:=libblas
PKG_VERSION:=3.7.0
PKG_RELEASE:=1

PKG_SOURCE:=blas-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://www.netlib.org/lapack/

PKG_BUILD_DIR:=$(BUILD_DIR)/BLAS-$(PKG_VERSION)

PKG_BUILD_DEPENDS:=python/host @INSTALL_GFORTRAN

PKG_INSTALL:=0

include $(INCLUDE_DIR)/package.mk

define Package/libblas
  TITLE:=The BLAS (Basic Linear Algebra Subprograms)
  SECTION:=libs
  DEFAULT:=m
  CATEGORY:=Libraries
  DEPENDS:=+libpthread +libc +libstdcpp +libgfortran
  URL:=http://www.netlib.org/blas/
endef

define Package/libblas/description
	The BLAS (Basic Linear Algebra Subprograms) are routines that provide standard building
	blocks for performing basic vector and matrix operations. The Level 1 BLAS perform scalar,
	vector and vector-vector operations, the Level 2 BLAS perform matrix-vector operations,
	and the Level 3 BLAS perform matrix-matrix operations.
endef

define Build/InstallDev
	$(INSTALL_DIR) \
		$(1)/usr/lib

	$(CP) $(PKG_BUILD_DIR)/*.a $(1)/usr/lib
endef

define Build/Compile
	$(MAKE) FORTRAN=$(REAL_GNU_TARGET_NAME)-gfortran -C $(PKG_BUILD_DIR)
endef

define Package/libblas/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/*.a $(1)/usr/lib
endef

$(eval $(call BuildPackage,libblas))
