#!/bin/sh

DATE="197304291400"
OBS="Library/Application Support/obs-studio"

# Prep
killall obs > /dev/null 2>&1

#sudo chown -R root `pwd` 
sudo find `pwd` -exec touch -ht $DATE '{}' \;

sudo rm -rf ~/"$OBS"

rm -f ~/Library/Preferences/*obs*
rm -f ~/Library/Preferences/*audio*

sudo rm -rf /Library/Preferences/Audio

osascript -e "set volume output volume 35"
osascript -e "set volume input volume 25"
osascript -e "set volume alert volume 0"

# Profiles
mkdir -p ~/"$OBS/basic"
ln -sf `pwd`/profiles ~/"$OBS/basic"

# Scenes
cp -a scenes ~/"$OBS/basic"

#
cp -a global.ini ~/"$OBS"
sudo find ~/"$OBS" -exec touch -ht $DATE '{}' \;
