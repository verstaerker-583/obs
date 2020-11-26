# init.lua
s/--collection 'gp'/--collection 'gp_local'/
s/FotoMagico = false/FotoMagico = true/
#s/Skype = false/Skype = true/
s/dev:setMode(1440, 900, 1)/dev:setMode(1680, 1050, 1)/
s/dev:setMode(1920, 1080, 1)/dev:setMode(5120, 2880, 1)/

# global.ini
/\[Basic\]/a\
Profile=gpYTsq\
ProfileDir=gpYTsq\
SceneCollection=gp_local\
SceneCollectionFile=gp_local
/AlwaysOnTop=true/d

# basic.ini
/\[Audio\]/a\
MonitoringDeviceId=AppleUSBAudioEngine:LG Electronics Inc.:USB Audio:141000:2
#MonitoringDeviceId=BuiltInSpeakerDevice
#MonitoringDeviceId=BuiltInHeadphoneOutputDevice

/\[SimpleOutput\]/a\
Preset=faster\
UseAdvanced=true
