.name = "bd_solo"
| del(
	.AuxAudioDevice2,
	(
		.sources[] |
			(
				., .settings.items[]? | select(.name == (
					"NDI",
					"Overlay Chat",
					"Overlay Donate",
					"guest"
					)
				)
			),
			(
				.hotkeys[
					"libobs.hide_scene_item.NDI",
					"libobs.hide_scene_item.Overlay Chat",
					"libobs.hide_scene_item.Overlay Donate",
					"libobs.hide_scene_item.guest",
					"libobs.show_scene_item.NDI",
					"libobs.show_scene_item.Overlay Chat",
					"libobs.show_scene_item.Overlay Donate",
					"libobs.show_scene_item.guest"
					]
			)
	),
	(
		.. | select(
			.enabled? == "false",
			.key? == (
				"OBS_KEY_F",
				"OBS_KEY_G",
				"OBS_KEY_H"
				)
		)
	)
)
| (.sources[] | select(.id == "browser_source").settings.url) |= gsub("html";"svg")
| (.sources[] | select(.id == "browser_source").settings.url) |= sub("cam";"bubbles")
| (.sources[] | select(.id == "browser_source").settings.url) |= sub("gp";"bd")
| (.sources[] | select(.name == "?").settings.color1) = 4284888012
| (.sources[] | select(.name == "?").settings.color2) = 4294967295
