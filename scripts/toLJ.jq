del(.sources[] |
	select(.id == "ffmpeg_source").settings,
	select(.id == "slideshow").settings.files,
	select(.name == "Screen Capture").settings,

	.mixers,
	select(.id == "av_capture_input").settings
)

| del(.[] |
	select(.id? == "coreaudio_input_capture")
)
