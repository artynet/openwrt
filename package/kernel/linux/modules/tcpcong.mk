#
# Copyright (C) 2006-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

NETWORK_SUPPORT_MENU:=Network Support

# bic

define KernelPackage/tcp-cong-bic
  SUBMENU:=$(NETWORK_SUPPORT_MENU)
  TITLE:=IPV4 TCP Congestion bic module
  KCONFIG:= \
       CONFIG_TCP_CONG_BIC=m

  FILES:= \
       $(LINUX_DIR)/net/ipv4/tcp_bic.ko
  AUTOLOAD:=$(call AutoLoad,99,tcp-cong-bic)
endef

define KernelPackage/tcp-cong-scalable/description
 IPV4 TCP Congestion bic module
endef

$(eval $(call KernelPackage,tcp-cong-bic))

# hstcp

define KernelPackage/tcp-cong-hstcp
  SUBMENU:=$(NETWORK_SUPPORT_MENU)
  TITLE:=IPV4 TCP Congestion highspeed module
  KCONFIG:= \
       CONFIG_TCP_CONG_HSTCP=m

  FILES:= \
       $(LINUX_DIR)/net/ipv4/tcp_highspeed.ko
  AUTOLOAD:=$(call AutoLoad,99,tcp-cong-hstcp)
endef

define KernelPackage/tcp-cong-hstcp/description
 IPV4 TCP Congestion hstcp module
endef

$(eval $(call KernelPackage,tcp-cong-hstcp))

# htcp

define KernelPackage/tcp-cong-htcp
  SUBMENU:=$(NETWORK_SUPPORT_MENU)
  TITLE:=IPV4 TCP Congestion htcp module
  KCONFIG:= \
       CONFIG_TCP_CONG_HTCP=m

  FILES:= \
       $(LINUX_DIR)/net/ipv4/tcp_htcp.ko
  AUTOLOAD:=$(call AutoLoad,99,tcp-cong-htcp)
endef

define KernelPackage/tcp-cong-htcp/description
 IPV4 TCP Congestion htcp module
endef

$(eval $(call KernelPackage,tcp-cong-htcp))

# hybla

define KernelPackage/tcp-cong-hybla
  SUBMENU:=$(NETWORK_SUPPORT_MENU)
  TITLE:=IPV4 TCP Congestion hybla module
  KCONFIG:= \
       CONFIG_TCP_CONG_HYBLA=m

  FILES:= \
       $(LINUX_DIR)/net/ipv4/tcp_hybla.ko
  AUTOLOAD:=$(call AutoLoad,99,tcp-cong-hybla)
endef

define KernelPackage/tcp-cong-hybla/description
 IPV4 TCP Congestion hybla module
endef

$(eval $(call KernelPackage,tcp-cong-hybla))

# illinois

define KernelPackage/tcp-cong-illinois
  SUBMENU:=$(NETWORK_SUPPORT_MENU)
  TITLE:=IPV4 TCP Congestion illinois module
  KCONFIG:= \
       CONFIG_TCP_CONG_ILLINOIS=m

  FILES:= \
       $(LINUX_DIR)/net/ipv4/tcp_illinois.ko
  AUTOLOAD:=$(call AutoLoad,99,tcp-cong-illinois)
endef

define KernelPackage/tcp-cong-illinois/description
 IPV4 TCP Congestion illinois module
endef

$(eval $(call KernelPackage,tcp-cong-illinois))

# lp

define KernelPackage/tcp-cong-lp
  SUBMENU:=$(NETWORK_SUPPORT_MENU)
  TITLE:=IPV4 TCP Congestion lp module
  KCONFIG:= \
       CONFIG_TCP_CONG_LP=m

  FILES:= \
       $(LINUX_DIR)/net/ipv4/tcp_lp.ko
  AUTOLOAD:=$(call AutoLoad,99,tcp-cong-lp)
endef

define KernelPackage/tcp-cong-lp/description
 IPV4 TCP Congestion lp module
endef

$(eval $(call KernelPackage,tcp-cong-lp))

# scalable

define KernelPackage/tcp-cong-scalable
  SUBMENU:=$(NETWORK_SUPPORT_MENU)
  TITLE:=IPV4 TCP Congestion Scalable module
  KCONFIG:= \
       CONFIG_TCP_CONG_SCALABLE=m

  FILES:= \
       $(LINUX_DIR)/net/ipv4/tcp_scalable.ko
  AUTOLOAD:=$(call AutoLoad,99,tcp-cong-scalable)
endef

define KernelPackage/tcp-cong-scalable/description
 IPV4 TCP scalable module
endef

$(eval $(call KernelPackage,tcp-cong-scalable))

# vegas

define KernelPackage/tcp-cong-vegas
  SUBMENU:=$(NETWORK_SUPPORT_MENU)
  TITLE:=IPV4 TCP Congestion vegas module
  KCONFIG:= \
       CONFIG_TCP_CONG_VEGAS=m

  FILES:= \
       $(LINUX_DIR)/net/ipv4/tcp_vegas.ko
  AUTOLOAD:=$(call AutoLoad,99,tcp-cong-vegas)
endef

define KernelPackage/tcp-cong-vegas/description
 IPV4 TCP vegas module
endef

$(eval $(call KernelPackage,tcp-cong-vegas))

# veno

define KernelPackage/tcp-cong-veno
  SUBMENU:=$(NETWORK_SUPPORT_MENU)
  TITLE:=IPV4 TCP Congestion veno module
  KCONFIG:= \
       CONFIG_TCP_CONG_VENO=m

  FILES:= \
       $(LINUX_DIR)/net/ipv4/tcp_veno.ko
  AUTOLOAD:=$(call AutoLoad,99,tcp-cong-veno)
endef

define KernelPackage/tcp-cong-veno/description
 IPV4 TCP veno module
endef

$(eval $(call KernelPackage,tcp-cong-veno))

# westwood

define KernelPackage/tcp-cong-westwood
  SUBMENU:=$(NETWORK_SUPPORT_MENU)
  TITLE:=IPV4 TCP Congestion westwood module
  KCONFIG:= \
       CONFIG_TCP_CONG_WESTWOOD=m

  FILES:= \
       $(LINUX_DIR)/net/ipv4/tcp_westwood.ko
  AUTOLOAD:=$(call AutoLoad,99,tcp-cong-westwood)
endef

define KernelPackage/tcp-cong-westwood/description
 IPV4 TCP westwood module
endef

$(eval $(call KernelPackage,tcp-cong-westwood))

# yeah

define KernelPackage/tcp-cong-yeah
  SUBMENU:=$(NETWORK_SUPPORT_MENU)
  TITLE:=IPV4 TCP Congestion yeah module
  KCONFIG:= \
       CONFIG_TCP_CONG_YEAH=m

  FILES:= \
       $(LINUX_DIR)/net/ipv4/tcp_yeah.ko
  AUTOLOAD:=$(call AutoLoad,99,tcp-cong-yeah)
  DEPENDS:=+kmod-tcp-cong-vegas
endef

define KernelPackage/tcp-cong-yeah/description
 IPV4 TCP yeah module
endef

$(eval $(call KernelPackage,tcp-cong-yeah))
