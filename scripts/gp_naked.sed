s/"name": "gp"/"name": "gp_naked"/

# hotkeys
/libobs.*Color Source/,/],/d
/libobs.*Slide Show/,/],/d

# scene items
/^\t\{6\}"name": "Color Source"/,/^\t\{5\}{/d
/^\t\{6\}"name": "Slide Show"/,/^\t\{5\}{/d

# sources
/^\t\{3\}"name": "Color Source"/,/^\t\{2\}{/d
/^\t\{3\}"name": "Slide Show"/,/^\t\{2\}{/d
