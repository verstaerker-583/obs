# init.lua
s/--collection 'gp'/--collection 'ss'/
s/--profile 'gpYTsq'/--profile 'jeYTsq'/
s/--enable-media-stream //
#s/--startvirtualcam //

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
UseAdvanced=true\
Preset=faster
