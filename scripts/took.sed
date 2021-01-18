# init.lua
s/--profile 'gpYTsq'/--profile 'gpYTlq'/
s/--startstreaming //

# global.ini
/\[Basic\]/a\
Profile=mmYTlq\
ProfileDir=mmYTlq\
SceneCollection=gp\
SceneCollectionFile=gp

# basic.ini
/\[Audio\]/a\
MonitoringDeviceId=AppleHDAEngineOutput:1B,0,1,1:0

/\[SimpleOutput\]/a\
UseAdvanced=true\
Preset=ultrafast
