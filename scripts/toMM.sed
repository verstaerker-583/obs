# init.lua
#s/dev:setMode(1440, 900, 1)/dev:setMode(1680, 1050, 1)/
s/dev:setMode(1920, 1080, 1)/dev:setMode(5120, 2880, 1)/

s/--profile '.*'/--profile 'gpYTsq'/

# global.ini
/\[Basic\]/a\
Profile=gpYTsq\
ProfileDir=gpYTsq\
SceneCollection=gp_naked\
SceneCollectionFile=gp_naked
/AlwaysOnTop=true/d

# basic.ini
#/\[Audio\]/a\
#MonitoringDeviceId=BuiltInHeadphoneOutputDevice

/\[SimpleOutput\]/a\
Preset=faster\
UseAdvanced=true
