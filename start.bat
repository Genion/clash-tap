@echo off
setlocal

set DEVICE_NAME=clash-tap

set PATH=%PATH%;%SystemRoot%\system32;%SystemRoot%\system32\wbem;%SystemRoot%\system32\WindowsPowerShell/v1.0

call add_tap_device.bat
call clash.vbs
call tun2socks.vbs

for /f "skip=3 tokens=4" %%a in ('netsh interface show interface') do (
  netsh interface ipv6 set interface %%a routerdiscovery=disabled
)
netsh interface ip add route 0.0.0.0/0 %DEVICE_NAME% 10.255.0.1 metric=0 store=active
ipconfig /flushdns
