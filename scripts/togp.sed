# init.lua
s/--profile '.*'/--profile 'mmYTmq'/
s/--collection '.*'/--collection 'gp_local'/

# global.ini
/\[Basic\]/a\
Profile=gpYTmq\
ProfileDir=gpYTmq\
SceneCollection=gp_local\
SceneCollectionFile=gp_local

/\[General\]/a\
HotkeyFocusType=DisableHotkeysOutOfFocus

# basic.ini
#/\[Audio\]/a\
#MonitoringDeviceId=BuiltInHeadphoneOutputDevice

/\[SimpleOutput\]/a\
Preset=ultrafast\
UseAdvanced=true
