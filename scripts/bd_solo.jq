.name = "bd_solo"
| del(
	(
		.sources[] |
			(
				., .settings.items[]? | select(.name == (
					"Guest",
					"Overlay Chat",
					"Overlay Donate",
					"Overlay Subscribe",
					"guest"
					)
				)
			),
			(
				.hotkeys[
					"libobs.hide_scene_item.Guest",
					"libobs.hide_scene_item.Overlay Chat",
					"libobs.hide_scene_item.Overlay Donate",
					"libobs.hide_scene_item.Overlay Subscribe",
					"libobs.hide_scene_item.guest",
					"libobs.show_scene_item.Guest",
					"libobs.show_scene_item.Overlay Chat",
					"libobs.show_scene_item.Overlay Donate",
					"libobs.show_scene_item.Overlay Subscribe",
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
| (.sources[] | select(.id == "browser_source").settings[]?|strings) |= gsub("html";"svg")
| (.sources[] | select(.id == "browser_source").settings[]?|strings) |= sub("cam";"bubbles")
| (.sources[] | select(.id == "browser_source").settings[]?|strings?)|= sub("gp";"bd")
| (.sources[] | select(.name == "?").settings.color1) = 4284888012
| (.sources[] | select(.name == "?").settings.color2) = 4294967295
