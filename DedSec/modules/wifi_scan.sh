#!/bin/bash
echo "Scanning Wi-Fi networks..."
termux-wifi-scaninfo || iwlist wlan0 scan | grep ESSID
