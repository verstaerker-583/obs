.name = "sr"
| del(
	(
		.sources[] |
			(
				., .settings.items[]? | select(
#					.name == "Color Source",
#					.name == "Slide Show"
					.name == "Screen Capture"
				)
			)
	),
	.DesktopAudioDevice1,
	(
		.. | select(.enabled? == "false")
	)
)
| (.sources[] | select(.name == "Overlay Chat").settings.width) = 560
| (.sources[] | select(.id == "browser_source").settings|
	.css,
	.url
	) |= sub("gp";"sr")
| (.sources[] | select(.id == "color_source").settings.color) = 4287868617
| (.sources[] | select(.name == "?").settings.color1) = 4287868617
| (.sources[] | select(.name == "?").settings.color2) = 4282145104
