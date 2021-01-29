# init.lua
s/--collection 'gp'/--collection 'ss'/
s/--enable-media-stream //
s/--profile 'gpYTsq'/--profile 'jeYTsq'/
s/--startvirtualcam //
s/gp\/html/je\/html/

# global.ini
/\[Basic\]/a\
Profile=jeYTsq\
ProfileDir=jeYTsq\
SceneCollection=ss\
SceneCollectionFile=ss
/\[General\]/a\
HotkeyFocusType=DisableHotkeysOutOfFocus

# basic.ini
/ScaleType/d
/\[Audio\]/a\
MonitoringDeviceId=BuiltInSpeakerDevice
#MonitoringDeviceId=BuiltInHeadphoneOutputDevice

/\[SimpleOutput\]/a\
UseAdvanced=true\
Preset=faster
