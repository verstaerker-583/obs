del(
	(
		.AuxAudioDevice2
	),
	(
		.sources[] |
			(
				select(.name == "Cam").hotkeys["libobs.hide_scene_item.screen"][] | select(.key == "OBS_KEY_NUM2")
			),
			(
				., .settings.items[]? | select(
					.name == "Intro",
					.name == "Outro",
					.name == "Video",
					.name == "NDI",
					.name == "guest"
				)
			),
			(
				.hotkeys[
					"libobs.hide_scene_item.Intro",
					"libobs.hide_scene_item.Outro",
					"libobs.hide_scene_item.Video",
					"libobs.show_scene_item.Intro",
					"libobs.show_scene_item.Outro",
					"libobs.show_scene_item.Video",
					"libobs.hide_scene_item.NDI",
					"libobs.hide_scene_item.guest",
					"libobs.show_scene_item.NDI",
					"libobs.show_scene_item.guest"
				]
			)
	),
	(
		.. | select(
			.key? == "OBS_KEY_I",
			.key? == "OBS_KEY_O",
			.key? == "OBS_KEY_V",
			.key? == "OBS_KEY_F",
			.key? == "OBS_KEY_G",
			.key? == "OBS_KEY_H",
			.enabled? == "false"
			)
	)
)
| (.sources[] | select(.name == "Cam").hotkeys["libobs.show_scene_item.screen"]) |= . + [{"key": "OBS_KEY_NUM2"}]

| (.sources[] | select(.name == "External").filters[] | select(.id == "clut_filter").settings.clut_amount) = 0.5
| (.sources[] | select(.name == "External").settings.device) = "0x14200000046d0823"
| (.sources[] | select(.name == "Internal").settings.device) = "CC27327P54QGDV4AV"
