del(
	(
		.[]|select(.name? == "NDI Audio")
	),
	(
		.sources[] |
			(
				., .settings.items[]? | select(
					.name == "NDI",
					.name == "Intro",
					.name == "Outro",
					.name == "Video"
				)
			),
			(
				.hotkeys[
					"libobs.hide_scene_item.NDI",
					"libobs.hide_scene_item.Intro",
					"libobs.hide_scene_item.Outro",
					"libobs.hide_scene_item.Video",
					"libobs.show_scene_item.NDI",
					"libobs.show_scene_item.Intro",
					"libobs.show_scene_item.Outro",
					"libobs.show_scene_item.Video"
				]
			)
	),
	(
		.. | select(
			.key? == "OBS_KEY_F",
			.key? == "OBS_KEY_G",
			.key? == "OBS_KEY_H",
			.key? == "OBS_KEY_I",
			.key? == "OBS_KEY_O",
			.key? == "OBS_KEY_V",
			.enabled? == "false"
			)
	)
)
| (.sources[] | select(.name == "External").settings.device) = "0x141300001bcf0215"
| (.sources[] | select(.name == "Internal").settings.device) = "CC26163C4LSGDV4AA"
