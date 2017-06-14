#!/bin/sh

SSID=""           #set your network ssid
PASSWORD=""       #set your network password
ENCRYPTION=""     #set your network encryption

/osjs/bin/arduino-wifi-connect.sh $SSID $ENCRYPTION $PASSWORD 1
