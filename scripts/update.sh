#!/bin/sh

chmod -R +w ~/Documents/GitHub/obs

gsed -f gpToSr.sed ../gp/okgp.json > ../sr/oksr.json

mkdir -p ../obs/scenes
gsed -f toMm.sed ../bd/okbd.json > ../obs/scenes/mmbd.json
gsed -f toMm.sed ../gp/okgp.json > ../obs/scenes/mmgp.json
gsed -f toMm.sed ../sr/oksr.json > ../obs/scenes/mmsr.json
gsed -f toMm.sed ../ap/okap.json > ../obs/scenes/mmap.json

mkdir -p ../profiles/okYTlq ../profiles/okYTmq
gsed -f lqProfiles.sed ../profiles/okRec/basic.ini > ../profiles/okYTlq/basic.ini
gsed -f mqProfiles.sed ../profiles/okRec/basic.ini > ../profiles/okYTmq/basic.ini

mkdir -p ../obs/profiles/mmRec ../obs/profiles/mmYTlq ../obs/profiles/mmYTmq
gsed -f toMm.sed ../profiles/okRec/basic.ini	> ../obs/profiles/mmRec/basic.ini
gsed -f toMm.sed ../profiles/okYTlq/basic.ini	> ../obs/profiles/mmYTlq/basic.ini
gsed -f toMm.sed ../profiles/okYTmq/basic.ini	> ../obs/profiles/mmYTmq/basic.ini

find ~/Documents/GitHub/obs -exec touch -ht 197304291400 '{}' \;
chmod -R +w ~/Documents/GitHub/obs

#cd ../.. 
#zip --symlinks -q -r ~/Desktop/`date "+%Y%m%d%H%M%S.zip"` obs/profiles/mm* obs/scenes/mm*.json
