s/"name": "bd_solo"/"name": "bd_lutz"/

# audio
/AuxAudioDevice/,/^\t}/d
/"mixers"/d

# sources
/^\t\{3\}"name": "Chat"/,/^\t\{2\}{/d
/^\t\{3\}"name": "FotoMagico"/,/^\t\{2\}{/d
/^\t\{6\}"name": "NDI"/,/^\t\{5\}{/d

# scene items
/^\t\{6\}"name": "Chat"/,/^\t\{5\}{/d
/^\t\{6\}"name": "FotoMagico"/,/^\t\{5\}{/d
/^\t\{6\}"name": "NDI"/,/^\t\{5\}{/d

# hotkeys
/libobs.*Chat/,/],/d
/libobs.*FotoMagico/,/],/d
/libobs.*NDI/,/],/d

/OBS_KEY_K"/d

# video
/"device"/d
/"device_name"/d

# slideshow
/"files":/,/],/d

# ffmpeg_source
/"input"/,+1d
