#!/bin/sh

sudo chown -R olaf ~/Documents/GitHub/obs
chmod -R +w ~/Documents/GitHub/obs

gsed -f bd_naked.sed ../bd/bd.json > ../bd/bd_naked.json
gsed -f bd_solo.sed ../gp/gp.json > ../bd/bd_solo.json
gsed -f bd_lutz.sed ../bd/bd_solo.json > ../bd/bd_lutz.json
gsed -f gp_naked.sed ../gp/gp.json > ../gp/gp_naked.json
gsed -f nd.sed ../gp/gp.json > ../nd/nd.json
gsed -f sr.sed ../gp/gp.json > ../sr/sr.json

mkdir -p ../profiles/YTlq ../profiles/YTmq ../profiles/YTsq
gsed -f lqProfiles.sed ../profiles/Rec/basic.ini > ../profiles/YTlq/basic.ini
gsed -f mqProfiles.sed ../profiles/Rec/basic.ini > ../profiles/YTmq/basic.ini
gsed -f sqProfiles.sed ../profiles/Rec/basic.ini > ../profiles/YTsq/basic.ini

mkdir -p ../magic/scenes
gsed -f toMm.sed ../bd/bd.json > ../magic/scenes/bd.json
gsed -f toMm.sed ../bd/bd_naked.json > ../magic/scenes/bd_naked.json
gsed -f toMm.sed ../bd/bd_solo.json > ../magic/scenes/bd_solo.json
gsed -f toMm.sed ../gp/gp.json > ../magic/scenes/gp.json
gsed -f toMm.sed ../gp/gp_naked.json > ../magic/scenes/gp_naked.json
gsed -f toMm.sed ../nd/nd.json > ../magic/scenes/nd.json
gsed -f toMm.sed ../sr/sr.json > ../magic/scenes/sr.json

mkdir -p ../magic/profiles/mmRec ../magic/profiles/mmYTlq ../magic/profiles/mmYTmq ../magic/profiles/mmYTsq
gsed -f toMm.sed ../profiles/Rec/basic.ini > ../magic/profiles/mmRec/basic.ini
gsed -f toMm.sed ../profiles/YTlq/basic.ini > ../magic/profiles/mmYTlq/basic.ini
gsed -f toMm.sed ../profiles/YTmq/basic.ini > ../magic/profiles/mmYTmq/basic.ini
gsed -f toMm.sed ../profiles/YTsq/basic.ini > ../magic/profiles/mmYTsq/basic.ini
cp -a ../profiles/YTlq/service.json ../magic/profiles/mmYTlq
ln -sf ../mmYTlq/service.json ../magic/profiles/mmYTmq
ln -sf ../mmYTlq/service.json ../magic/profiles/mmYTsq

mkdir -p ../magic/profiles/bdYTlq ../magic/profiles/bdYTmq ../magic/profiles/bdYTsq
gsed -f toBd.sed ../magic/profiles/mmYTlq/basic.ini > ../magic/profiles/bdYTlq/basic.ini
gsed -f toBd.sed ../magic/profiles/mmYTmq/basic.ini > ../magic/profiles/bdYTmq/basic.ini
gsed -f toBd.sed ../magic/profiles/mmYTsq/basic.ini > ../magic/profiles/bdYTsq/basic.ini
ln -sf ../bdYTlq/service.json ../magic/profiles/bdYTmq
ln -sf ../bdYTlq/service.json ../magic/profiles/bdYTsq

mkdir -p ../magic/profiles/gpYTlq ../magic/profiles/gpYTmq ../magic/profiles/gpYTsq
gsed -f toGp.sed ../magic/profiles/mmYTlq/basic.ini > ../magic/profiles/gpYTlq/basic.ini
gsed -f toGp.sed ../magic/profiles/mmYTmq/basic.ini > ../magic/profiles/gpYTmq/basic.ini
gsed -f toGp.sed ../magic/profiles/mmYTsq/basic.ini > ../magic/profiles/gpYTsq/basic.ini
ln -sf ../gpYTlq/service.json ../magic/profiles/gpYTmq
ln -sf ../gpYTlq/service.json ../magic/profiles/gpYTsq

find ~/Documents/GitHub/obs -d -exec touch -ht 197304291400 '{}' \;

chmod -R -w ~/Documents/GitHub/obs
chmod -R +w ~/Documents/GitHub/obs/.git

exit 0

cd ..
zip --symlinks -q -r ~/Desktop/`date "+%Y%m%d%H%M%S.zip"` magic
