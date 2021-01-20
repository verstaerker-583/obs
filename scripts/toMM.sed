# init.lua
s/--collection 'gp'/--collection 'mm'/
s/--profile 'gpYTsq'/--profile 'mmYTsq'/
s/Mode01w = 1440/Mode01w = 1920/
s/Mode01h = 900/Mode01h = 1200/
s/--always-on-top //

# global.ini
/\[Basic\]/a\
Profile=mmYTsq\
ProfileDir=mmYTsq\
SceneCollection=mm\
SceneCollectionFile=mm
#Profile=gpYTsq\
#ProfileDir=gpYTsq\
#SceneCollection=gp\
#SceneCollectionFile=gp

# basic.ini
/\[Audio\]/a\
MonitoringDeviceId=BuiltInHeadphoneOutputDevice
#MonitoringDeviceId=AppleUSBAudioEngine:LG Electronics Inc.:USB Audio:141000:2
#MonitoringDeviceId=BuiltInSpeakerDevice

/\[SimpleOutput\]/a\
UseAdvanced=true\
Preset=faster
