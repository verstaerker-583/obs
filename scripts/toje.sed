# init.lua
s/--profile '.*'/--profile 'jeYTmq'/
s/--collection '.*'/--collection 'ss'/

# global.ini
/\[Basic\]/a\
Profile=jeYTmq\
ProfileDir=jeYTmq\
SceneCollection=ss\
SceneCollectionFile=ss

/\[SimpleOutput\]/a\
Preset=ultrafast\
UseAdvanced=true
