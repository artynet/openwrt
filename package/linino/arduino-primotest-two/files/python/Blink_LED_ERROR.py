#!/usr/bin/python

import os,time

while 1:
	os.system("echo 1 > /sys/class/gpio/D8/value")
	time.sleep(0.2)
	os.system("echo 0 > /sys/class/gpio/D8/value")
	time.sleep(0.2)
