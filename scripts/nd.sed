s/"name": "gp"/"name": "nk"/
s/"current_scene": "Start"/"current_scene": "Cam"/

# audio
/AuxAudioDevice/,/^\t}/d

# hotkeys
/libobs.*?/,/],/d
/libobs.*Color Source/,/],/d
/libobs.*Intro/,/],/d
/libobs.*NDI/,/],/d
/libobs.*Overlay Cam/,/],/d
/libobs.*Overlay Donate/,/],/d

# scene items
/^\t\{6\}"name": "?"/,/^\t\{5\}{/d
/^\t\{6\}"name": "Color Source"/,/^\t\{5\}{/d
/^\t\{6\}"name": "Intro"/,/^\t\{5\}{/d
/^\t\{6\}"name": "NDI"/,/^\t\{5\}{/d
/^\t\{6\}"name": "Overlay Donate"/,/^\t\{5\}{/d

# sources
/^\t\{3\}"name": "?"/,/^\t\{2\}{/d
/^\t\{3\}"name": "Color Source"/,/^\t\{2\}{/d
/^\t\{3\}"name": "Intro"/,/^\t\{2\}{/d
/^\t\{3\}"name": "NDI"/,/^\t\{2\}{/d
/^\t\{3\}"name": "Outro"/,/^\t\{2\}{/d
/^\t\{3\}"name": "Overlay Cam"/,/^\t\{2\}{/d
/^\t\{3\}"name": "Overlay Donate"/,/^\t\{2\}{/d
/^\t\{3\}"name": "Overlay Finish"/,/^\t\{2\}{/d
/^\t\{3\}"name": "Overlay Start"/,/^\t\{2\}{/d

# scenes
/^\t\{3\}"name": "Finish"/,/^\t\{2\}{/d
/^\t\{3\}"name": "Start"/,/^\t\{2\}{/d

/OBS_KEY_I"/,+2d
/OBS_KEY_K"/d
