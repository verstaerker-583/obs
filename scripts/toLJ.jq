del(.sources[] |
	select(
		.id == "av_capture_input",
		.id == "ffmpeg_source",
		.name == "Screen Capture"
	).settings,
	select(.id == "slideshow").settings.files,

	.mixers
)

| del(.[] |select(.id? == "coreaudio_input_capture"))
