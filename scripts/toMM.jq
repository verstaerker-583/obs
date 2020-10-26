.
| (.sources[] | select(.name == "External").settings.device) = "0x2543000043e9a4d"
| (.sources[] | select(.name == "Internal").settings.device) = "0x8020000005ac8514"

| (.sources[] | select(.name == "Intro").settings.local_file) = "/Users/markus/Documents/DieWeltImBlick/intro.mov"
| (.sources[] | select(.name == "Outro").settings.local_file) = "/Users/markus/Documents/DieWeltImBlick/outro.mov"
| (.sources[] | select(.name == "Video").settings.local_file) = "/Users/markus/Documents/DieWeltImBlick/video.mp4"
#| (.sources[] | select(.id == "slideshow").settings.files) = [{"value": "/Users/markus/Documents/DieWeltImBlick/Pictures"}]

# demo
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.markus-mauthe.de/site/assets/files/1046/e1.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.markus-mauthe.de/site/assets/files/1046/e2.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.markus-mauthe.de/site/assets/files/1046/e3.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.markus-mauthe.de/site/assets/files/1046/e4.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.markus-mauthe.de/site/assets/files/1046/e5.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.markus-mauthe.de/site/assets/files/1046/e6.jpg"}]
