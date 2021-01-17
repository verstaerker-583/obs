# init.lua
s/--profile 'gpYTsq'/--profile 'gpYTmq'/
s/--collection 'gp'/--collection 'new'/
s/--startstreaming //

# global.ini
/\[Basic\]/a\
Profile=mmYTmq\
ProfileDir=mmYTmq\
SceneCollection=new\
SceneCollectionFile=new
#SceneCollection=gp\
#SceneCollectionFile=gp

# basic.ini
/\[Audio\]/a\
MonitoringDeviceId=AppleHDAEngineOutput:1B,0,1,1:0

/\[SimpleOutput\]/a\
Preset=ultrafast\
UseAdvanced=true
