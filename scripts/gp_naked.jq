.name = "gp_naked"
| del(
	.DesktopAudioDevice1,
	(
		.sources[] |
			(
				., .settings.items[]? | select(.name == (
					"Color Source",
					"Slide Show"
#					"Screen Capture"
					)
				)
			)
	),
	(
		.. | select(
			.enabled? == "false"
		)
	)
)
