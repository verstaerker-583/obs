.
| (.sources[] | select(.name == "External").settings.device) = "0x2543000043e9a4d"
| (.sources[] | select(.name == "Internal").settings.device) = "0x8020000005ac8514"
| (.sources[] | select(.name == "Intro").settings.local_file) = "/Users/markus/Documents/DieWeltImBlick/intro"
| (.sources[] | select(.name == "Outro").settings.local_file) = "/Users/markus/Documents/DieWeltImBlick/outro"
| (.sources[] | select(.name == "Video").settings.local_file) = "/Users/markus/Documents/DieWeltImBlick/video"
