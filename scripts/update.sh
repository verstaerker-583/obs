#!/bin/sh

sudo chown -R olaf ~/Documents/GitHub/obs
chmod -R +w ~/Documents/GitHub/obs

# scenes
jq -S --tab -f bd_solo.jq	../gp/gp.json		> ../bd/bd_solo.json
jq -S --tab -f gp_naked.jq	../gp/gp.json		> ../gp/gp_naked.json
jq -S --tab -f nd.jq		../gp/gp.json		> ../gp/nd.json
jq -S --tab -f sr.jq		../gp/gp.json		> ../sr/sr.json
jq -S --tab -f bd_naked.jq	../bd/bd.json		> ../bd/bd_naked.json

jq -S --tab -f toLJ.jq		../bd/bd_solo.json	> ../bd/bd_lutz.json

# profiles
mkdir -p ../profiles/YTlq ../profiles/YTmq ../profiles/YTsq
sed -f profilesLq.sed basic.ini > ../profiles/YTlq/basic.ini
sed -f profilesMq.sed basic.ini > ../profiles/YTmq/basic.ini
sed -f profilesSq.sed basic.ini > ../profiles/YTsq/basic.ini

PAYLOAD="../pkg/obs-studio"
# mm scenes
mkdir -p $PAYLOAD/basic/scenes
for i in `ls ../*/*.json`; do
	[ `basename $i` == "bd_lutz.json" ] || jq -S --tab -f toMM.jq $i > $PAYLOAD/basic/scenes/`basename $i`;
done

# mm profiles
for CHANNEL in bd gp mm; do
	for i in `ls ../profiles`; do
		mkdir -p $PAYLOAD/basic/profiles/$CHANNEL$i
		lq="YTlq"
		sed -e '
			s/Name=ok/Name='$CHANNEL'/
			s/AppleHDAEngineOutput:1B,0,1,1:0/BuiltInHeadphoneOutputDevice/
			' ../profiles/$i/basic.ini > $PAYLOAD/basic/profiles/$CHANNEL$i/basic.ini
			[ $i == $lq ] || ln -sf ../$CHANNEL$lq/service.json  $PAYLOAD/basic/profiles/$CHANNEL$i
	done
done

sudo find ~/Documents/GitHub/obs -exec touch -ht 197304291400 '{}' \;

chmod -R -w ~/Documents/GitHub/obs
chmod -R +w ~/Documents/GitHub/obs/.git

chmod -R +w $PAYLOAD
#chmod -R -w $PAYLOAD/basic/profiles
#sudo chown -R root $PAYLOAD/basic/profiles

pkgbuild \
	--identifier magic\
	--install-location /tmp/obs-studio\
	--ownership preserve\
	--quiet\
	--root $PAYLOAD\
	--scripts ../pkg/scripts\
	--version `date "+%Y%m%d%H%M%S"`\
       	~/Desktop/magic.pkg
