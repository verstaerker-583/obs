#!/bin/sh

#chmod -R +w ~/Documents/obs/profiles
#chmod -R +w ~/Documents/obs/scenes

gsed -f gpTosr.sed ../gp/okgp.json > ../sr/oksr.json

gsed -f toMm.sed ../bd/okbd.json > ../bd/mmbd.json
gsed -f toMm.sed ../gp/okgp.json > ../gp/mmgp.json
gsed -f toMm.sed ../sr/oksr.json > ../sr/mmsr.json


mkdir -p ../profiles/okYTlq ../profiles/okYTmq
gsed -f lqProfiles.sed ../profiles/okRec/basic.ini > ../profiles/okYTlq/basic.ini
gsed -f mqProfiles.sed ../profiles/okRec/basic.ini > ../profiles/okYTmq/basic.ini

mkdir -p ../profiles/mmRec ../profiles/mmYTlq ../profiles/mmYTmq
gsed -f toMm.sed ../profiles/okRec/basic.ini > ../profiles/mmRec/basic.ini
gsed -f toMm.sed ../profiles/okYTlq/basic.ini > ../profiles/mmYTlq/basic.ini
gsed -f toMm.sed ../profiles/okYTmq/basic.ini > ../profiles/mmYTmq/basic.ini

#mkdir -p ../profiles/gpYTlq ../profiles/gpYTmq
#gsed -f toGp.sed ../profiles/okYTlq/basic.ini > ../profiles/gpYTlq/basic.ini
#gsed -f toGp.sed ../profiles/okYTmq/basic.ini > ../profiles/gpYTmq/basic.ini

#cd ~
#zip --symlinks -q -r "Desktop/"`date "+%Y%m%d%H%M%S.zip"`\
#       "Documents/obs" -x@"Documents/obs/exclude.list"
