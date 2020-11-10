del(
	.AuxAudioDevice2,
	.DesktopAudioDevice1,
	(
		.AuxAudioDevice1.filters[] | select(.id == "noise_gate_filter")
	),
	(
		.sources[] |
			(
				., .settings.items[]? | select(.name == (
					"NDI",
					"Outro",
					"Video",
					"guest"
					)
				)
			),
			(
				.hotkeys[
					"libobs.hide_scene_item.NDI",
					"libobs.hide_scene_item.Outro",
					"libobs.hide_scene_item.Video",
					"libobs.hide_scene_item.guest",
					"libobs.show_scene_item.NDI",
					"libobs.show_scene_item.Outro",
					"libobs.show_scene_item.Video",
					"libobs.show_scene_item.guest"
					]
			)
	),
	(
		.. | select(.key? == (
			"OBS_KEY_F",
			"OBS_KEY_G",
			"OBS_KEY_H",
			"OBS_KEY_O",
			"OBS_KEY_V"
			)
		)
	)
)
| (.sources[] | select(.name == "External").filters[] | select(.id == "clut_filter").settings.clut_amount) = 1
| (.sources[] | select(.name == "External").filters[] | select(.id == "color_filter").settings.gamma) = -0.25
| (.sources[] | select(.name == "External").settings.device) = "0x141300001bcf0215"
| (.sources[] | select(.name == "Internal").settings.device) = "CC26163C4LSGDV4AA"
| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "Overlay Chat").pos.y) = 510
| (.sources[] | select(.name == "Overlay Chat").settings.height) = 210
