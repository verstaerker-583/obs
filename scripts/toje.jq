del(
	.DesktopAudioDevice1,
#	(
#		.AuxAudioDevice1.filters[] | select(.id == "noise_gate_filter")
#	),
	(
		.sources[] |
			(
				., .settings.items[]? | select(.name == (
					"GuestA",
					"Outro",
					"guests"
					)
				)
			),
			(
				.hotkeys[
					"libobs.hide_scene_item.GuestA",
					"libobs.hide_scene_item.Outro",
					"libobs.hide_scene_item.guests",
					"libobs.show_scene_item.GuestA",
					"libobs.show_scene_item.Outro",
					"libobs.show_scene_item.guests"
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
| (.AuxAudioDevice1.filters[] | select(.id == "noise_suppress_filter").settings.method) = "rnnoise"
| (.sources[] | select(.name == "External").filters) |= . + [{"id": "color_filter"}]
| (.sources[] | select(.name == "External").filters[] | select(.id == "color_filter").name) = "Color Correction" 
| (.sources[] | select(.name == "External").filters[] | select(.id == "color_filter").settings.contrast) = -0.15
| (.sources[] | select(.name == "External").filters[] | select(.id == "color_filter").settings.gamma) = -1.75
| (.sources[] | select(.name == "External").filters[] | select(.id == "color_filter").settings.saturation) = 0.35
| (.sources[] | select(.name == "External").settings.device) = "0x11120001bcf0215"
| (.sources[] | select(.name == "Internal").settings.device) = "EAB7A68FEC2B4487AADFD8A91C1CB782"
| (.sources[] | select(.name == "Intro").settings.local_file) = "/Users/johanneserdmann/Desktop/intro.mp4"
| (.sources[] | select(.name == "Intro").volume) = 0.5
