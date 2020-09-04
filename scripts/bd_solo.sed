s/"name": "gp"/"name": "bd_solo"/

s/"color": 4280204915/"color": 4288269363/

s/"color1": 4281467135/"color1": 4284888012/
s/"color2": 4279828552/"color2": 4294967295/

s/gp\/html\/cam.html/bd\/svg\/bubbles.svg/
s/gp\/html\/finish.html/bd\/svg\/finish.svg/
s/gp\/html\/start.html/bd\/svg\/start.svg/

# sources
/^\t\{3\}"name": "Chat"/,/^\t\{2\}{/d
/^\t\{3\}"name": "Overlay Donate"/,/^\t\{2\}{/d

# scene items
/^\t\{6\}"name": "Chat"/,/^\t\{5\}{/d
/^\t\{6\}"name": "Overlay Donate"/,/^\t\{5\}{/d

# hotkeys
/libobs.*Chat/,/],/d
/libobs.*Overlay Donate/,/],/d
