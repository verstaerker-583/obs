# init.lua
s/--collection 'gp'/--collection 'ss'/
s/--profile 'gpYTsq'/--profile 'jeYTsq'/
s/--startvirtualcam //

# global.ini
/\[Basic\]/a\
Profile=jeYTsq\
ProfileDir=jeYTsq\
SceneCollection=ss\
SceneCollectionFile=ss

# basic.ini
/\[Audio\]/a\
MonitoringDeviceId=BuiltInSpeakerDevice
#MonitoringDeviceId=BuiltInHeadphoneOutputDevice

/\[SimpleOutput\]/a\
Preset=faster\
UseAdvanced=true
