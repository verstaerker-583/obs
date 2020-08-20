#!/bin/sh

sudo chown -R olaf ~/Documents/GitHub/obs
chmod -R +w ~/Documents/GitHub/obs

gsed -f gpToSr.sed ../gp/okgp.json > ../sr/oksr.json
gsed -f gpToTz.sed ../gp/okgp.json > ../tz/oktz.json

mkdir -p ../magic/scenes
gsed -f toMm.sed ../bd/okbd.json > ../magic/scenes/mmbd.json
gsed -f toMm.sed ../bd/okbd_naked.json > ../magic/scenes/mmbd_naked.json
gsed -f toMm.sed ../gp/okgp.json > ../magic/scenes/mmgp.json
gsed -f toMm.sed ../sr/oksr.json > ../magic/scenes/mmsr.json
gsed -f toMm.sed ../ap/okap.json > ../magic/scenes/mmap.json

mkdir -p ../profiles/okYTlq ../profiles/okYTmq
gsed -f lqProfiles.sed ../profiles/okRec/basic.ini > ../profiles/okYTlq/basic.ini
gsed -f mqProfiles.sed ../profiles/okRec/basic.ini > ../profiles/okYTmq/basic.ini

mkdir -p ../magic/profiles/mmRec ../magic/profiles/mmYTlq ../magic/profiles/mmYTmq
gsed -f toMm.sed ../profiles/okRec/basic.ini	> ../magic/profiles/mmRec/basic.ini
gsed -f toMm.sed ../profiles/okYTlq/basic.ini	> ../magic/profiles/mmYTlq/basic.ini
gsed -f toMm.sed ../profiles/okYTmq/basic.ini	> ../magic/profiles/mmYTmq/basic.ini

mkdir -p ../magic/profiles/gpYTlq ../magic/profiles/gpYTmq
gsed -f toGp.sed ../profiles/okYTlq/basic.ini	> ../magic/profiles/gpYTlq/basic.ini
gsed -f toGp.sed ../profiles/okYTmq/basic.ini	> ../magic/profiles/gpYTmq/basic.ini

find ~/Documents/GitHub/obs -exec touch -ht 197304291400 '{}' \;

chmod -R -w ~/Documents/GitHub/obs
chmod -R +w ~/Documents/GitHub/obs/.git

exit 0
cd ..
zip --symlinks -q -r ~/Desktop/`date "+%Y%m%d%H%M%S.zip"` magic
