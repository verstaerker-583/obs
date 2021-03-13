# init.lua
s/Mode01h = 900/Mode01h = 1200/
s/Mode01w = 1440/Mode01w = 1920/
s/OBS --args/& --collection 'mm'/
s/OBS --args/& --profile 'mmYTmq'/
s/gp\/html/mm\/html/

# global.ini
/\[Basic\]/a\
Profile=mmYTmq\
ProfileDir=mmYTmq\
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
