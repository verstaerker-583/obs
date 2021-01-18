.name = "nd"
| del(
	(
		.[]|select(.id? == "coreaudio_input_capture")
	),
	(
		.sources[] |
			(
				select(.name == "?").settings.color1,
				select(.name == "?").settings.color2,
				select(.name == "Start").settings
			),
			(
				., .settings.items[]? | select(
					(.name | test("Overlay")),
					.name == (
						"Finish",
						"Intro",
						"Guest",
						"Outro",
						"guest"
					)
				)
			),
			(
				.hotkeys[
					"libobs.hide_scene_item.Intro",
					"libobs.hide_scene_item.Guest",
					"libobs.hide_scene_item.Overlay Chat",
					"libobs.hide_scene_item.Overlay Donate",
					"libobs.hide_scene_item.Overlay Subscribe",
					"libobs.hide_scene_item.guest",
					"libobs.show_scene_item.Intro",
					"libobs.show_scene_item.Guest",
					"libobs.show_scene_item.Overlay Cam",
					"libobs.show_scene_item.Overlay Chat",
					"libobs.show_scene_item.Overlay Donate",
					"libobs.show_scene_item.Overlay Subscribe",
					"libobs.show_scene_item.guest"
					]
			)
	),
	(
		.. | select(
			.key? == (
				"OBS_KEY_F",
				"OBS_KEY_G",
				"OBS_KEY_H",
				"OBS_KEY_I"
				)
		)
	)
)
| (.sources[] | select(.name == "Start").hotkeys["OBSBasic.SelectScene"]) |= . + [{"key": "OBS_KEY_4"}]
