# init.lua
s/dev:setMode(1440, 900, 1)/dev:setMode(2880, 1800, 1)/
s/dev:setMode(1920, 1080, 1)/dev:setMode(5120, 2880, 1)/

s/'YTsq/'gpYTsq/

# basic.ini
s/=YTsq/=gpYTsq/
/\[Audio\]/a\
MonitoringDeviceId=BuiltInSpeakerDevice
#MonitoringDeviceId=BuiltInHeadphoneOutputDevice
