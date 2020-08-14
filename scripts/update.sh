#!/bin/sh

chmod -R +w ~/Documents/GitHub/obs

gsed -f gpToSr.sed ../gp/okgp.json > ../sr/oksr.json

mkdir -p ../scenes
gsed -f toMm.sed ../bd/okbd.json > ../scenes/mmbd.json
gsed -f toMm.sed ../gp/okgp.json > ../scenes/mmgp.json
gsed -f toMm.sed ../sr/oksr.json > ../scenes/mmsr.json
gsed -f toMm.sed ../ap/okap.json > ../scenes/mmap.json

mkdir -p ../profiles/okYTlq ../profiles/okYTmq
gsed -f lqProfiles.sed ../profiles/okRec/basic.ini > ../profiles/okYTlq/basic.ini
gsed -f mqProfiles.sed ../profiles/okRec/basic.ini > ../profiles/okYTmq/basic.ini

gsed -f toMm.sed ../profiles/okRec/basic.ini > ../profiles/mmRec/basic.ini
gsed -f toMm.sed ../profiles/okYTlq/basic.ini > ../profiles/mmYTlq/basic.ini
gsed -f toMm.sed ../profiles/okYTmq/basic.ini > ../profiles/mmYTmq/basic.ini

find ~/Documents/GitHub/obs -exec touch -ht 197304291400 '{}' \;
chmod -R +w ~/Documents/GitHub/obs

#cd ../.. 
#zip --symlinks -q -r ~/Desktop/`date "+%Y%m%d%H%M%S.zip"` obs/profiles/mm* obs/scenes/mm*.json
