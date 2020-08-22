#!/bin/sh

sudo chown -R olaf ~/Documents/GitHub/obs
chmod -R +w ~/Documents/GitHub/obs

gsed -f gpToSr.sed ../gp/gp.json > ../sr/sr.json
gsed -f bd_naked.sed ../bd/bd.json > ../bd/bd_naked.json

mkdir -p ../magic/scenes
gsed -f toMm.sed ../bd/bd.json > ../magic/scenes/bd.json
gsed -f toMm.sed ../bd/bd_naked.json > ../magic/scenes/bd_naked.json
gsed -f toMm.sed ../gp/gp.json > ../magic/scenes/gp.json
gsed -f toMm.sed ../sr/sr.json > ../magic/scenes/sr.json
gsed -f toMm.sed ../ap/ap.json > ../magic/scenes/ap.json

mkdir -p ../profiles/YTlq ../profiles/YTmq
gsed -f lqProfiles.sed ../profiles/Rec/basic.ini > ../profiles/YTlq/basic.ini
gsed -f mqProfiles.sed ../profiles/Rec/basic.ini > ../profiles/YTmq/basic.ini

mkdir -p ../magic/profiles/mmRec ../magic/profiles/mmYTlq ../magic/profiles/mmYTmq
gsed -f toMm.sed ../profiles/Rec/basic.ini	> ../magic/profiles/mmRec/basic.ini
gsed -f toMm.sed ../profiles/YTlq/basic.ini	> ../magic/profiles/mmYTlq/basic.ini
gsed -f toMm.sed ../profiles/YTmq/basic.ini	> ../magic/profiles/mmYTmq/basic.ini

cp -a	../profiles/YTlq/service.json	../magic/profiles/mmYTlq
ln -sf	../mmYTlq/service.json		../magic/profiles/mmYTmq

mkdir -p ../magic/profiles/gpYTlq ../magic/profiles/gpYTmq
gsed -f toGp.sed ../profiles/YTlq/basic.ini	> ../magic/profiles/gpYTlq/basic.ini
gsed -f toGp.sed ../profiles/YTmq/basic.ini	> ../magic/profiles/gpYTmq/basic.ini

ln -sf	../gpYTlq/service.json		../magic/profiles/gpYTmq

find ~/Documents/GitHub/obs -d -exec touch -ht 197304291400 '{}' \;

chmod -R -w ~/Documents/GitHub/obs
chmod -R +w ~/Documents/GitHub/obs/.git

cd ..
zip --symlinks -q -r ~/Desktop/`date "+%Y%m%d%H%M%S.zip"` magic
