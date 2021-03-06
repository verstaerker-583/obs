#!/bin/sh

function profiles {
	for CHANNEL in $1; do
		for i in `ls ../profiles`; do
			mkdir -p /tmp/target/$OBSUSR/basic/profiles/$CHANNEL$i
			SQ="YTsq"
			sed -e '
				s/Name=/Name='$CHANNEL'/
				' ../profiles/$i/basic.ini|sed -f to$OBSUSR.sed > /tmp/target/$OBSUSR/basic/profiles/$CHANNEL$i/basic.ini
	
				[ $i == $SQ ] || ln -sf ../$CHANNEL$SQ/service.json /tmp/target/$OBSUSR/basic/profiles/$CHANNEL$i
		done
		cp templates/service$CHANNEL.json /tmp/target/$OBSUSR/basic/profiles/$CHANNEL$SQ/service.json
	done
	
	sed -f to$OBSUSR.sed templates/global.ini > /tmp/target/$OBSUSR/global.ini
	sed -f to$OBSUSR.sed templates/init.lua > /tmp/target/$OBSUSR/init.lua
}

function package {
	for OBSUSR in $1; do
		pkgbuild\
			--identifier magic\
			--install-location /tmp/obs-studio\
			--quiet\
			--root /tmp/target/$OBSUSR\
			--scripts ../pkg/scripts\
			--version `date "+%Y%m%d%H%M%S"`\
			/tmp/magic$OBSUSR.pkg
		#	--info ../pkg/PackageInfo\
	done
}

sudo chown -R olaf ~/Documents/GitHub/obs
chmod -R +w ~/Documents/GitHub/obs

# masks
/Applications/Inkscape.app/Contents/MacOS/inkscape -w 640 -h 360 --export-type="png" ../*/*Mask.svgz &>/dev/null

# scenes
jq -S --tab -c -f mm.jq		../gp/gp.json		> ../mm/mm.json
jq -S --tab -c -f nd.jq		../gp/gp.json		> ../gp/nd.json
jq -S --tab -c -f sr.jq		../gp/gp.json		> ../sr/sr.json
jq -S --tab -c -f ss.jq		../gp/gp.json		> ../ss/ss.json

jq -S --tab -c -f bd_solo.jq	../gp/gp.json		> ../bd/bd_solo.json
jq -S --tab -c -f tolj.jq	../bd/bd_solo.json	> ../bd/bd_lutz.json

for QUALITY in lq mq sq; do
	mkdir -p ../profiles/YT$QUALITY
	sed -f profiles$QUALITY.sed templates/basic.ini > ../profiles/YT$QUALITY/basic.ini
done

sudo rm -rf /tmp/target

#
# je
#
OBSUSR="je"

# scenes
mkdir -p /tmp/target/$OBSUSR/basic/scenes
for i in `ls ../*/*.json`; do
	[ `basename $i` == "ss.json" ] && jq -S --tab -f to$OBSUSR.jq $i > /tmp/target/$OBSUSR/basic/scenes/`basename $i`
done

# profiles
profiles "je"

#
# ok
#
OBSUSR="ok"

# scenes
mkdir -p /tmp/target/$OBSUSR/basic/scenes
for i in `ls ../*/*.json`; do
	jq -S --tab -f to$OBSUSR.jq $i > /tmp/target/$OBSUSR/basic/scenes/`basename $i`
done

# profiles
#profiles "bd gp mm"
profiles "mm"

#
# mm
#
OBSUSR="mm"

# scenes
mkdir -p /tmp/target/$OBSUSR/basic/scenes
for i in `ls ../*/*.json`; do
	[ `basename $i` == "bd_lutz.json" -o `basename $i` == "ss.json" ] || jq -S --tab -f to$OBSUSR.jq $i > /tmp/target/$OBSUSR/basic/scenes/`basename $i`
done

# profiles
#profiles "bd gp mm"
profiles "bd mm"

#
# th
#
OBSUSR="th"

# scenes
mkdir -p /tmp/target/$OBSUSR/basic/scenes
for i in `ls ../*/*.json`; do
	[ `basename $i` == "gp.json" ] && jq -S --tab -f to$OBSUSR.jq $i > /tmp/target/$OBSUSR/basic/scenes/`basename $i`
done

# profiles
profiles "gp"

#
#
#

sudo find ~/Documents/GitHub/obs -exec touch -ht 197304291400 '{}' \;
chmod -R -w ~/Documents/GitHub/obs
chmod -R +w ~/Documents/GitHub/obs/.git

#package "je mm ok th"
package "je mm ok"
