@echo off

set batteryInfoLocation=%CD%\BatteryInfoView.exe
set outputLocation=%CD%\Raw\
set outputName=Battery-%COMPUTERNAME%
set fileType=.xml

mkdir %outputLocation%

%batteryInfoLocation% /sxml %outputLocation%%outputName%%fileType%