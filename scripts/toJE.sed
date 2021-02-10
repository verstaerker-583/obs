# init.lua
s/ --enable-media-stream//
s/ --startvirtualcam//
s/OBS --args/& --collection 'ss'/
s/OBS --args/& --profile 'jeYTmq'/
s/gp\/html/je\/html/

# global.ini
/\[Basic\]/a\
Profile=jeYTsq\
ProfileDir=jeYTsq\
SceneCollection=ss\
SceneCollectionFile=ss

# basic.ini
#/\[Audio\]/a\
#MonitoringDeviceId=BuiltInSpeakerDevice
#MonitoringDeviceId=BuiltInHeadphoneOutputDevice

/\[SimpleOutput\]/a\
UseAdvanced=true\
Preset=ultrafast
