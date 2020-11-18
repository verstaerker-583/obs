# init.lua
s/Skype = false/Skype = true/
s/FotoMagico = false/FotoMagico = true/
s/dev:setMode(1440, 900, 1)/dev:setMode(1680, 1050, 1)/
s/dev:setMode(1920, 1080, 1)/dev:setMode(5120, 2880, 1)/

# global.ini
/\[Basic\]/a\
Profile=gpYTsq\
ProfileDir=gpYTsq\
SceneCollection=gp_naked\
SceneCollectionFile=gp_naked
/AlwaysOnTop=true/d

# basic.ini
/\[Audio\]/a\
MonitoringDeviceId=BuiltInHeadphoneOutputDevice
#MonitoringDeviceId=BuiltInSpeakerDevice

/\[SimpleOutput\]/a\
Preset=faster\
UseAdvanced=true
