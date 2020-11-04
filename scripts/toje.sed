# init.lua
s/--collection '.*'/--collection 'ss'/
s/--profile '.*'/--profile 'jeYTmq'/

# global.ini
/\[Basic\]/a\
Profile=jeYTmq\
ProfileDir=jeYTmq\
SceneCollection=ss\
SceneCollectionFile=ss

/\[SimpleOutput\]/a\
Preset=ultrafast\
UseAdvanced=true
