# init.lua
s/--collection '.*'/--collection 'ss'/
s/--profile '.*'/--profile 'jeYTmq'/

# global.ini
/\[Basic\]/a\
Profile=jeYTmq\
ProfileDir=jeYTmq\
SceneCollection=ss\
SceneCollectionFile=ss

# basic.ini
#/\[Audio\]/a\
#MonitoringDeviceId=AppleHDAEngineOutput:1B,0,1,1:0

/\[SimpleOutput\]/a\
Preset=ultrafast\
UseAdvanced=true
