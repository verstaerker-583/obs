.name = "bd_naked"
| del(
	(
		.sources[] |
			(
				select(.name == "NDI").filters[] | select(.id != "mask_filter")
			),
			(
				., .settings.items[]? | select(
#					.name == "Color Source",
#					.name == "Slide Show"
					.name == "Screen Capture"
				)
			)
	),
	.DesktopAudioDevice1,
	(.AuxAudioDevice2.filters[] | select(.id != "limiter_filter")),
	(
		.. | select(
			.key? == "OBS_KEY_G",
			.key? == "OBS_KEY_M",
			.enabled? == "false"
			)
	)
)
| (
	.AuxAudioDevice1.hotkeys["libobs.unmute"],
	.AuxAudioDevice2.hotkeys["libobs.unmute"]
	) |= . + [{"key": "OBS_KEY_I"}]
