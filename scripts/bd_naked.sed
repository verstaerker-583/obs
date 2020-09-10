s/"name": "bd"/"name": "bd_naked"/

/OBS_KEY_D"/,+2d
/OBS_KEY_M"/,+2d
/OBS_KEY_G"/,+2d

# filters
/^\t\{4\}"enabled": true/,/^\t\{3\}{/d
/^\t\{5\}"enabled": true/,/^\t\{4\}{/d
