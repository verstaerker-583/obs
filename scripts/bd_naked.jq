.name = "bd_naked"
| del(
#	.DesktopAudioDevice1,
	(
		.AuxAudioDevice2.filters[] | select(.id != "limiter_filter")
	),
	(
		.sources[] |
			(
				select(.name == "NDI").filters[] | select(.id != "mask_filter")
			),
			(
				., .settings.items[]? | select(.name == (
#					"Color Source",
#					"Slide Show"
					"Screen Capture"
					)
				)
			)
	),
	(
		.. | select(
			.enabled? == "false",
			.key? == (
				"OBS_KEY_D",
				"OBS_KEY_G",
				"OBS_KEY_M"
				)
		)
	)
)
