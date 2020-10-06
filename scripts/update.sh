#!/bin/sh

sudo chown -R olaf ~/Documents/GitHub/obs
chmod -R +w ~/Documents/GitHub/obs

# masks
/Applications/Inkscape.app/Contents/MacOS/inkscape --export-type="png" ../*/*Mask.svg &>/dev/null

# scenes
jq -S --tab -f gp_naked.jq	../gp/gp.json		> ../gp/gp_naked.json
jq -S --tab -f gp_40.jq		../gp/gp.json		> ../gp40/gp_40.json
jq -S --tab -f nd.jq		../gp/gp.json		> ../gp/nd.json
jq -S --tab -f sr.jq		../gp/gp_naked.json	> ../sr/sr.json

jq -S --tab -f bd_solo.jq	../gp/gp_naked.json	> ../bd/bd_solo.json
jq -S --tab -f tolj.jq		../bd/bd_solo.json	> ../bd/bd_lutz.json
jq -S --tab -f bd_naked.jq	../bd/bd.json		> ../bd/bd_naked.json

for QUALITY in lq mq sq; do
	mkdir -p ../profiles/YT$QUALITY
	sed -f profiles$QUALITY.sed templates/basic.ini > ../profiles/YT$QUALITY/basic.ini
done

#
# ok
#
killall obs 2&> /dev/null 

sudo rm -rf ~/"Library/Application Support/obs-studio"

# ok scenes
mkdir -p ~/"Library/Application Support/obs-studio/basic/scenes"
for i in `ls ../*/*.json`; do
	[ `basename $i` == "bd_lutz.json" ] || jq -S --tab "." $i > ~/"Library/Application Support/obs-studio/basic/scenes/`basename $i`"
done

# ok profiles
for QUALITY in lq mq sq; do
	mkdir -p ~/"Library/Application Support/obs-studio/basic/profiles/YT$QUALITY"
	sed -f profiles$QUALITY.sed templates/basic.ini|sed -f took.sed > ~/"Library/Application Support/obs-studio/basic/profiles/YT$QUALITY/basic.ini"
done

sudo cp templates/init.lua ~/.hammerspoon
sed -f took.sed templates/global.ini > ~/"Library/Application Support/obs-studio/global.ini"

#
# mm
#

sudo rm -rf /tmp/obs-studio

# mm scenes
USERS="mm"
mkdir -p /tmp/obs-studio/basic/scenes
for i in `ls ../*/*.json`; do
	[ `basename $i` == "bd_lutz.json" ] || jq -S --tab -f tomm.jq $i > /tmp/obs-studio/basic/scenes/`basename $i`
done

# mm profiles
for CHANNEL in bd gp mm; do
	for i in `ls ../profiles`; do
		mkdir -p /tmp/obs-studio/basic/profiles/$CHANNEL$i
		LQ="YTlq"
		sed -e '
			s/Name=/Name='$CHANNEL'/
			' ../profiles/$i/basic.ini|sed -f tomm.sed > /tmp/obs-studio/basic/profiles/$CHANNEL$i/basic.ini

			[ $i == $LQ ] || ln -sf ../$CHANNEL$LQ/service.json /tmp/obs-studio/basic/profiles/$CHANNEL$i
	done
	cp templates/service$CHANNEL.json /tmp/obs-studio/basic/profiles/$CHANNEL$LQ/service.json
done

sed -f tomm.sed templates/global.ini > /tmp/obs-studio/global.ini
sed -f tomm.sed ~/.hammerspoon/init.lua > /tmp/obs-studio/init.lua

sudo find ~/Documents/GitHub/obs -exec touch -ht 197304291400 '{}' \;
sudo find /tmp/obs-studio -exec touch -ht 197304291400 '{}' \;
chmod -R -w ~/Documents/GitHub/obs
chmod -R +w ~/Documents/GitHub/obs/.git

exit 0

pkgbuild \
	--identifier magic\
	--install-location /tmp/obs-studio\
	--ownership recommended\
	--quiet\
	--root /tmp/obs-studio\
	--scripts ../pkg/scripts\
	--version `date "+%Y%m%d%H%M%S"`\
	/tmp/magic.pkg
#	--ownership preserve\
#	--info ../pkg/PackageInfo\
