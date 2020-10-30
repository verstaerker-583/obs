.name = "gp_naked"
| del(
	(
		.sources[] |
			(
				., .settings.items[]? | select(
					.name == "Color Source",
					.name == "Slide Show"
#					.name == "Screen Capture"
				)
			)
	),
	.DesktopAudioDevice1,
	(
		.. | select(
			.enabled? == "false"
			)
	)
)
