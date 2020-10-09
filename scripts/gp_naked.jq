.name = "gp_naked"
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
