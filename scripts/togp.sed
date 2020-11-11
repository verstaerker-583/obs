# init.lua
#s/--collection 'gp_naked'/--collection 'gp_local'/
s/--profile 'gpYTsq'/--profile 'gpYTmq'/

# global.ini
/\[Basic\]/a\
Profile=gpYTmq\
ProfileDir=gpYTmq\
SceneCollection=gp_naked\
SceneCollectionFile=gp_naked
#SceneCollection=gp_local\
#SceneCollectionFile=gp_local

# basic.ini
/\[Audio\]/a\
MonitoringDeviceId=AppleHDAEngineOutput:1B,0,1,1:0

/\[SimpleOutput\]/a\
Preset=ultrafast\
UseAdvanced=true
