del(.sources[] | 
	select(.id == "ffmpeg_source").settings,
	select(.id == "slideshow").settings.files
)
| (.sources[] | select(.id == "window_capture").settings.owner_name) = "FotoMagico 5"
| (.sources[] | select(.id == "window_capture").settings.window_name) = ""

| (.sources[] | select(.name == "External").settings.device) = "0x2543000043e9a4d",
| (.sources[] | select(.name == "Internal").settings.device) = "0x8020000005ac8514"
