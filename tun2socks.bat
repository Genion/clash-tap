@echo off

tun2socks.exe -proxyServer 127.0.0.1:7890 -tunDns 10.255.0.2 -tunName clash-tap > tun2socks.log
