.name = "bd_naked"
| del(
	(
		.AuxAudioDevice2.filters[] | select(.id != "limiter_filter")
	),
	(
		.sources[] |
			(
				select(.name == "NDI").filters[] | select(.id != "mask_filter")
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
