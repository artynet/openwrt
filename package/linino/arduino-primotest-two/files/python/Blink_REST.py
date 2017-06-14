#!/usr/bin/python

import os,time

IP="192.168.240.1"
PORT="8080"
PIN="9"
while 1:
	os.system("curl http://"+IP+":"+PORT+"/arduino/digital/"+PIN+"/1")
	time.sleep(0.2)
	os.system("curl http://"+IP+":"+PORT+"/arduino/digital/"+PIN+"/0")
	time.sleep(0.2)
