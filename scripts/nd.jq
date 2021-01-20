.name = "nd"
| del(
	(
		.sources[] |
			(
				., .settings.items[]? | select(.name == (
					"GuestA",
					"GuestB",
					"GuestX",
					"Host",
					"Overlay Chat",
					"Overlay Donate",
					"Overlay Subscribe",
					"cam+",
					"guest",
					"guest+",
					"host"
					)
				)
			),
			(
				.hotkeys[
					"libobs.hide_scene_item.GuestA",
					"libobs.hide_scene_item.GuestB",
					"libobs.hide_scene_item.Overlay Chat",
					"libobs.hide_scene_item.Overlay Donate",
					"libobs.hide_scene_item.Overlay Subscribe",
					"libobs.hide_scene_item.cam+",
					"libobs.show_scene_item.GuestA",
					"libobs.show_scene_item.GuestB",
					"libobs.show_scene_item.Overlay Chat",
					"libobs.show_scene_item.Overlay Donate",
					"libobs.show_scene_item.Overlay Subscribe",
					"libobs.show_scene_item.cam+"
					]
			)
	),
	(
		.. | select(
			.key? == (
				"OBS_KEY_F",
				"OBS_KEY_V",
				"OBS_KEY_B",
				"OBS_KEY_N",
				"OBS_KEY_X",
				"OBS_KEY_T",
				"OBS_KEY_Y",
				"OBS_KEY_G",
				"OBS_KEY_H"
				)
		)
	)
)
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
						"Outro"
					)
				)
			)
	)
)
| (.sources[] | select(.name == "Start").hotkeys["OBSBasic.SelectScene"]) |= . + [{"key": "OBS_KEY_4"}]
