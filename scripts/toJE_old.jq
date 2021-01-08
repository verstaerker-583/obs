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
					"guest"
					)
				)
			),
			(
				.hotkeys[
					"libobs.hide_scene_item.NDI",
					"libobs.hide_scene_item.Outro",
					"libobs.hide_scene_item.guest",
					"libobs.show_scene_item.NDI",
					"libobs.show_scene_item.Outro",
					"libobs.show_scene_item.guest"
					]
			)
	),
	(
		.. | select(.key? == (
			"OBS_KEY_F",
			"OBS_KEY_G",
			"OBS_KEY_H",
			"OBS_KEY_O"
			)
		)
	)
)
#| (.AuxAudioDevice1.filters[] | select(.id == "noise_gate_filter").settings.open_threshold) = -32
| (.sources[] | select(.name == "External").filters) |= . + [{"id": "color_filter"}]
| (.sources[] | select(.name == "External").filters[] | select(.id == "color_filter").name) = "Color Correction" 
| (.sources[] | select(.name == "External").filters[] | select(.id == "color_filter").settings.contrast) = -0.15
| (.sources[] | select(.name == "External").filters[] | select(.id == "color_filter").settings.gamma) = -1.75
| (.sources[] | select(.name == "External").filters[] | select(.id == "color_filter").settings.saturation) = 0.35
| (.sources[] | select(.name == "External").settings.device) = "0x141200001bcf0215"
| (.sources[] | select(.name == "Internal").settings.device) = "CC26163C4LSGDV4AA"
| (.sources[] | select(.name == "Intro").settings.local_file) = "/Users/johanneserdmann/Desktop/intro.mp4"
| (.sources[] | select(.name == "Intro").volume) = 0.5

| del(..|.monitoring_type?)
| (.sources[] | select(.id == "display_capture").settings.display) = 0 
