del(.sources[] | 
	select(.id == "ffmpeg_source").settings,
	select(.id == "slideshow").settings.files
)
| (.sources[] | select(.id == "ffmpeg").settings.close_when_inactive) = true

| (.sources[] | select(.name == "External").settings.device) = "0x2543000043e9a4d"
| (.sources[] | select(.name == "Internal").settings.device) = "0x8020000005ac8514"

| (.sources[] | select(.name == "Intro").settings.local_file) = "/Users/markus/Documents/DieWeltImBlick/intro.mov"
| (.sources[] | select(.name == "Outro").settings.local_file) = "/Users/markus/Documents/DieWeltImBlick/outro.mov"
