#!/bin/sh

opkg update
opkg remove openocd
opkg install /root/02-openocd-dev_0.10.0-3_ar71xx.ipk
