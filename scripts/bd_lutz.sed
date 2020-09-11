s/"name": "bd_solo"/"name": "bd_lutz"/

# audio
/AuxAudioDevice/,/^\t}/d
/"mixers"/d

# sources
/^\t\{3\}"name": "Overlay Chat"/,/^\t\{2\}{/d
/^\t\{3\}"name": "FotoMagico"/,/^\t\{2\}{/d
/^\t\{3\}"name": "NDI"/,/^\t\{2\}{/d

# scene items
/^\t\{6\}"name": "FotoMagico"/,/^\t\{5\}{/d
/^\t\{6\}"name": "NDI"/,/^\t\{5\}{/d
/^\t\{6\}"name": "Overlay Chat"/,/^\t\{5\}{/d

# hotkeys
/libobs.*FotoMagico/,/],/d
/libobs.*NDI/,/],/d
/libobs.*Overlay Chat/,/],/d

/OBS_KEY_G"/d

# video
/"device"/d
/"device_name"/d

# slideshow
/"files":/,/],/d

# ffmpeg_source
/"input"/,+1d
