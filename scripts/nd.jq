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
						"NDI",
						"Outro",
						"Video",
						"guest",
						"Color Source",
						"Slide Show"
#						"Screen Capture"
					)
				)
			),
			(
				.hotkeys[
					"libobs.hide_scene_item.Intro",
					"libobs.hide_scene_item.NDI",
					"libobs.hide_scene_item.Overlay Chat",
					"libobs.hide_scene_item.Overlay Donate",
					"libobs.hide_scene_item.Video",
					"libobs.hide_scene_item.guest",
					"libobs.show_scene_item.Intro",
					"libobs.show_scene_item.NDI",
					"libobs.show_scene_item.Overlay Cam",
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
				"OBS_KEY_F",
				"OBS_KEY_G",
				"OBS_KEY_H",
				"OBS_KEY_I",
				"OBS_KEY_V"
				)
		)
	)
)
| (.sources[] | select(.name == "Start").hotkeys["OBSBasic.SelectScene"]) |= . + [{"key": "OBS_KEY_4"}]
