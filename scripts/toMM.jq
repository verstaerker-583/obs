del(.sources[] | 
	select(.id == "slideshow").settings.files,
	select(.id == "ffmpeg_source").settings,
	select(.id == "window_capture").settings
)

| (.sources[] | select(.name == "Intro").settings.local_file) = "/Users/markus/DieWeltImBlick/intro.mov"
| (.sources[] | select(.name == "Outro").settings.local_file) = "/Users/markus/DieWeltImBlick/outro.mov"
| (.sources[] | select(.id == "window_capture").settings.owner_name) = "FotoMagico 5"
| (.sources[] | select(.id == "window_capture").settings.window_name) = ""

| (.sources[] | select(.name == "External").settings.device) = "0x2543000043e9a4d"
| (.sources[] | select(.name == "Internal").settings.device) = "0x8020000005ac8514"

# experimental
| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "screen").scale_filter) = "lanczos"
| (.sources[] | select(.name == "cams").settings.items[].scale_filter) = "lanczos"
| (.sources[] | select(.name == "guest").settings.items[].scale_filter) = "lanczos"
