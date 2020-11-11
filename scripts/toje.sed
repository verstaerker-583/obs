# init.lua
s/--collection 'gp_naked'/--collection 'ss'/
s/--profile 'gpYTsq'/--profile 'jeYTmq'/
s/dev:setInputVolume(.*) -- USB/dev:setInputVolume(75) -- USB/
			

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
