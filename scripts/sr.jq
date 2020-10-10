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
			),
			(
				.hotkeys[
#					"libobs.show_scene_item.Color Source",
#					"libobs.show_scene_item.Slide Show"
					"libobs.show_scene_item.Screen Capture"
				]
			)
	),
	.DesktopAudioDevice1,
	(
		.. | select(.enabled? == "false")
	)
)

| (.sources[] | select(.name == "Overlay Chat").settings.width) = 560

| (.sources[] | select(.id == "browser_source").settings.css) |= sub("gp";"sr")
| (.sources[] | select(.id == "browser_source").settings.url) |= sub("gp";"sr")
| (.sources[] | select(.id == "color_source").settings.color) = 4287868617
| (.sources[] | select(.name == "?").settings.color1) = 4287868617
| (.sources[] | select(.name == "?").settings.color2) = 4282145104
