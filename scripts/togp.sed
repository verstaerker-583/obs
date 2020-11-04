# init.lua
s/--collection '.*'/--collection 'gp_local'/
s/--profile '.*'/--profile 'gpYTmq'/

# global.ini
/\[Basic\]/a\
Profile=gpYTmq\
ProfileDir=gpYTmq\
SceneCollection=gp_naked\
SceneCollectionFile=gp_naked
#SceneCollection=gp_local\
#SceneCollectionFile=gp_local

/\[SimpleOutput\]/a\
Preset=ultrafast\
UseAdvanced=true
