# init.lua
s/--profile 'gpYTsq'/--profile 'mmYTlq'/
s/--startstreaming //
s/gp\/html/mm\/html/

# global.ini
/\[Basic\]/a\
Profile=mmYTlq\
ProfileDir=mmYTlq\
SceneCollection=mm\
SceneCollectionFile=mm

# basic.ini
/ScaleType/d
/\[Audio\]/a\
MonitoringDeviceId=AppleHDAEngineOutput:1B,0,1,1:0

/\[SimpleOutput\]/a\
UseAdvanced=true\
Preset=ultrafast
