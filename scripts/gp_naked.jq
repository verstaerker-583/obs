.name = "gp_naked"
| del(
	(
		.sources[] |
			(
				., .settings.items[]? | select(
					.name == "Video",
#					.name == "Color Source",
#					.name == "Slide Show"
					.name == "Screen Capture"
				)
			),
			(
				.hotkeys[
					"libobs.hide_scene_item.Intro",
					"libobs.hide_scene_item.Outro",
					"libobs.hide_scene_item.Video",
					"libobs.show_scene_item.Intro",
					"libobs.show_scene_item.Outro",
					"libobs.show_scene_item.Video"
				]
			)
	),
	.DesktopAudioDevice1,
	(
		.. | select(
			.key? == "OBS_KEY_V",
			.enabled? == "false"
			)
	)
)
