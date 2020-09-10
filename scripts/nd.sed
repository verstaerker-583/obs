s/"name": "gp"/"name": "nd"/
s/"current_scene": "Start"/"current_scene": "Cam"/

s/"color": 4280204915/"color": 4287868617/

s/"color1": 4281467135/"color1": 4287868617/
s/"color2": 4279828552/"color2": 4282145104/

# audio
/AuxAudioDevice/,/^\t}/d

# sources
#/^\t\{3\}"name": "?"/,/^\t\{2\}{/d
/^\t\{3\}"name": "Background"/,/^\t\{2\}{/d
/^\t\{3\}"name": "Chat"/,/^\t\{2\}{/d
#/^\t\{3\}"name": "Color Source"/,/^\t\{2\}{/d
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

# scene items
#/^\t\{6\}"name": "?"/,/^\t\{5\}{/d
/^\t\{6\}"name": "Background"/,/^\t\{5\}{/d
/^\t\{6\}"name": "Chat"/,/^\t\{5\}{/d
#/^\t\{6\}"name": "Color Source"/,/^\t\{5\}{/d
/^\t\{6\}"name": "Intro"/,/^\t\{5\}{/d
/^\t\{6\}"name": "NDI"/,/^\t\{5\}{/d
/^\t\{6\}"name": "Overlay Cam"/,/^\t\{5\}{/d
/^\t\{6\}"name": "Overlay Donate"/,/^\t\{5\}{/d

# hotkeys
#/libobs.*?/,/],/d
/libobs.*Background/,/],/d
/libobs.*Chat/,/],/d
#/libobs.*Color Source/,/],/d
/libobs.*Intro/,/],/d
/libobs.*NDI/,/],/d
/libobs.*Overlay Cam/,/],/d
/libobs.*Overlay Donate/,/],/d

/OBS_KEY_G"/d
/OBS_KEY_I"/,+2d
