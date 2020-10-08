#!/bin/sh

function profiles {
	for CHANNEL in $1; do
		for i in `ls ../profiles`; do
			mkdir -p ../target/$OBSUSR/basic/profiles/$CHANNEL$i
			SQ="YTsq"
			sed -e '
				s/Name=/Name='$CHANNEL'/
				' ../profiles/$i/basic.ini|sed -f to$OBSUSR.sed > ../target/$OBSUSR/basic/profiles/$CHANNEL$i/basic.ini
	
				[ $i == $SQ ] || ln -sf ../$CHANNEL$SQ/service.json ../target/$OBSUSR/basic/profiles/$CHANNEL$i
		done
		cp templates/service$CHANNEL.json ../target/$OBSUSR/basic/profiles/$CHANNEL$SQ/service.json
	done
	
	sed -f to$OBSUSR.sed templates/global.ini > ../target/$OBSUSR/global.ini
	sed -f to$OBSUSR.sed templates/init.lua > ../target/$OBSUSR/init.lua
}

function package {
	for OBSUSR in $1; do
		pkgbuild\
			--identifier magic\
			--install-location /tmp/obs-studio\
			--ownership recommended\
			--quiet\
			--root ../target/$OBSUSR\
			--scripts ../pkg/scripts\
			--version `date "+%Y%m%d%H%M%S"`\
			/tmp/magic$OBSUSR.pkg
		#	--ownership preserve\
		#	--info ../pkg/PackageInfo\
	done
}

sudo chown -R olaf ~/Documents/GitHub/obs
chmod -R +w ~/Documents/GitHub/obs

# masks
/Applications/Inkscape.app/Contents/MacOS/inkscape --export-type="png" ../*/*Mask.svg &>/dev/null

# scenes
jq -S --tab -f gp_local.jq		../gp/gp.json		> ../gp40/gp_local.json
jq -S --tab -f gp_naked.jq	../gp/gp.json		> ../gp/gp_naked.json
jq -S --tab -f nd.jq		../gp/gp.json		> ../gp/nd.json
jq -S --tab -f sr.jq		../gp/gp_naked.json	> ../sr/sr.json

jq -S --tab -f bd_naked.jq	../bd/bd.json		> ../bd/bd_naked.json
jq -S --tab -f bd_solo.jq	../gp/gp_naked.json	> ../bd/bd_solo.json
#jq -S --tab -f tolj.jq		../bd/bd_solo.json	> ../bd/bd_lutz.json

for QUALITY in lq mq sq; do
	mkdir -p ../profiles/YT$QUALITY
	sed -f profiles$QUALITY.sed templates/basic.ini > ../profiles/YT$QUALITY/basic.ini
done

#
# ok
#
OBSUSR="ok"
sudo rm -rf ../target/$OBSUSR

# scenes
mkdir -p ../target/$OBSUSR/basic/scenes
for i in `ls ../*/*.json`; do
	jq -S --tab -f to$OBSUSR.jq $i > ../target/$OBSUSR/basic/scenes/`basename $i`
done

# profiles
profiles "gp mm"

#
# mm
#
OBSUSR="mm"
sudo rm -rf ../target/$OBSUSR

# scenes
mkdir -p ../target/$OBSUSR/basic/scenes
for i in `ls ../*/*.json`; do
	[ `basename $i` == "bd_lutz.json" -o `basename $i` == "gp_local.json" ] || jq -S --tab -f to$OBSUSR.jq $i > ../target/$OBSUSR/basic/scenes/`basename $i`
done

# profiles
profiles "bd gp mm"

#
# gp
#
OBSUSR="gp"
sudo rm -rf ../target/$OBSUSR

# scenes
mkdir -p ../target/$OBSUSR/basic/scenes
for i in `ls ../*/*.json`; do
	[ `basename $i` == "gp_local.json" ] && jq -S --tab -f to$OBSUSR.jq $i > ../target/$OBSUSR/basic/scenes/`basename $i`
done

# profiles
profiles "gp"

#
#
#

sudo find ~/Documents/GitHub/obs -exec touch -ht 197304291400 '{}' \;
chmod -R -w ~/Documents/GitHub/obs
chmod -R +w ~/Documents/GitHub/obs/.git

package "gp mm ok"
