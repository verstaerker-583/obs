.name = "bd_solo"
| del(
	.AuxAudioDevice2,
#	.DesktopAudioDevice1,
	(
		.sources[] |
			(
				., .settings.items[]? | select(.name == (
					"NDI",
					"Overlay Chat",
					"Overlay Donate",
					"Video",
					"guest",
					"Color Source",
					"Slide Show"
#					"Screen Capture"
					)
				)
			),
			(
				.hotkeys[
					"libobs.hide_scene_item.NDI",
					"libobs.hide_scene_item.Overlay Chat",
					"libobs.hide_scene_item.Overlay Donate",
					"libobs.hide_scene_item.Video",
					"libobs.hide_scene_item.guest",
					"libobs.show_scene_item.NDI",
					"libobs.show_scene_item.Overlay Chat",
					"libobs.show_scene_item.Overlay Donate",
					"libobs.show_scene_item.Video",
					"libobs.show_scene_item.guest"
					]
			)
	),
	(
		.. | select(
			.enabled? == "false",
			.key? == (
				"OBS_KEY_B",
				"OBS_KEY_F",
				"OBS_KEY_G",
				"OBS_KEY_H",
				"OBS_KEY_V"
				)
		)
	)
)
| (.sources[] | select(.id == "browser_source").settings.url) |= gsub("html";"svg")
| (.sources[] | select(.id == "browser_source").settings.url) |= sub("cam";"bubbles")
| (.sources[] | select(.id == "browser_source").settings.url) |= sub("gp";"bd")
| (.sources[] | select(.id == "color_source").settings.color) = 4288269363
| (.sources[] | select(.name == "?").settings.color1) = 4284888012
| (.sources[] | select(.name == "?").settings.color2) = 4294967295
