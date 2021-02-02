# init.lua
s/ --startstreaming//
s/ --startvirtualcam//
s/OBS --args/& --collection 'mm'/
s/OBS --args/& --profile 'mmYTlq'/
s/gp\/html/mm\/html/

# global.ini
/\[Basic\]/a\
Profile=mmYTlq\
ProfileDir=mmYTlq\
SceneCollection=mm\
SceneCollectionFile=mm

# basic.ini
/\[Audio\]/a\
MonitoringDeviceId=AppleHDAEngineOutput:1B,0,1,1:0

/\[SimpleOutput\]/a\
UseAdvanced=true\
Preset=ultrafast
