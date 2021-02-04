# init.lua
s/ --enable-media-stream//
s/ --startvirtualcam//
s/OBS --args/& --collection 'ss'/
s/OBS --args/& --profile 'jeYTsq'/
s/gp\/html/je\/html/
s/hs.autoLaunch(true)/hs.autoLaunch(false)/

# global.ini
/\[Basic\]/a\
Profile=jeYTsq\
ProfileDir=jeYTsq\
SceneCollection=ss\
SceneCollectionFile=ss

/\[General\]/a\
HotkeyFocusType=DisableHotkeysOutOfFocus

# basic.ini
/\[Audio\]/a\
MonitoringDeviceId=AppleHDAEngineOutput:1B,0,1,1:0
#MonitoringDeviceId=BuiltInSpeakerDevice
#MonitoringDeviceId=BuiltInHeadphoneOutputDevice

/\[SimpleOutput\]/a\
UseAdvanced=true\
Preset=ultrafast
