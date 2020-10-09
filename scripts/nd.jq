.name = "nd"
| del(
	(.[]|select(.id? == "coreaudio_input_capture")),
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
					.name == "Finish",
					.name == "Intro",
					.name == "NDI",
					.name == "Outro",
					.name == "Video",
					.name == "guest",
					.name == "Color Source",
#					.name == "Slide Show"
					.name == "Screen Capture"
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
					"libobs.show_scene_item.Overlay Start",
					"libobs.show_scene_item.Video",
					"libobs.show_scene_item.guest",
					"libobs.show_scene_item.Color Source",
#					"libobs.show_scene_item.Slide Show"
					"libobs.show_scene_item.Screen Capture"
				]
			)
	),
	(
		.. | select(
			.key? == "OBS_KEY_F",
			.key? == "OBS_KEY_G",
			.key? == "OBS_KEY_H",
			.key? == "OBS_KEY_I",
			.key? == "OBS_KEY_V",
			.enabled? == "false"
			)
	)
)
