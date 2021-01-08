# init.lua
#s/FotoMagico = false/FotoMagico = true/
#s/Skype = false/Skype = true/
s/--profile 'gpYTsq'/--profile 'gpYTmq'/

# global.ini
/\[Basic\]/a\
Profile=mmYTmq\
ProfileDir=mmYTmq\
SceneCollection=new\
SceneCollectionFile=new
/AlwaysOnTop=true/d

# basic.ini
/\[Audio\]/a\
MonitoringDeviceId=AppleHDAEngineOutput:1B,0,1,1:0

/\[SimpleOutput\]/a\
Preset=ultrafast\
UseAdvanced=true
