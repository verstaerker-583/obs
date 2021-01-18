# init.lua
s/--profile 'gpYTsq'/--profile 'gpYTmq'/
s/--startvirtualcam //
s/--enable-media-stream //

# global.ini
/\[Basic\]/a\
Profile=gpYTmq\
ProfileDir=gpYTmq\
SceneCollection=gp\
SceneCollectionFile=gp

# basic.ini
/\[Audio\]/a\
MonitoringDeviceId=AppleHDAEngineOutput:1B,0,1,1:0

/\[SimpleOutput\]/a\
UseAdvanced=true\
Preset=ultrafast
