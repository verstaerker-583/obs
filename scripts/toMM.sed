# init.lua
s/dev:setMode(1440, 900, 1)/dev:setMode(2880, 1800, 1)/
s/dev:setMode(1920, 1080, 1)/dev:setMode(5120, 2880, 1)/

s/'YTsq/'gpYTsq/

# global.ini
s/=YTsq/=gpYTsq/

# basic.ini
/\[Audio\]/a\
MonitoringDeviceId=BuiltInHeadphoneOutputDevice

#/\[SimpleOutput\]/a\
#RecQuality=Small\

# experimental
/\[SimpleOutput\]/a\
Preset=faster\
UseAdvanced=true

/\[Video\]/a\
ScaleType=lanczos