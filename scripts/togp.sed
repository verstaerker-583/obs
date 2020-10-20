# init.lua
s/--profile '.*'/--profile 'gpYTmq'/
s/--collection '.*'/--collection 'gp_local'/

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
