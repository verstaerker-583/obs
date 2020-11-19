# init.lua
#s/--collection 'gp'/--collection 'gp_local'/
s/--profile 'gpYTsq'/--profile 'gpYTmq'/

# global.ini
/\[Basic\]/a\
Profile=gpYTmq\
ProfileDir=gpYTmq\
SceneCollection=gp\
SceneCollectionFile=gp
#SceneCollection=gp_local\
#SceneCollectionFile=gp_local

# basic.ini
/\[Audio\]/a\
MonitoringDeviceId=AppleHDAEngineOutput:1B,0,1,1:0

/\[SimpleOutput\]/a\
Preset=ultrafast\
UseAdvanced=true
