#
del(
	(
		.AuxAudioDevice1.filters[] | select(.id == "noise_gate_filter")
	),
	(
		.sources[] |
			(
				., .settings.items[]? | select(.name == (
					"GuestA",
					"GuestB",
					"GuestX",
					"Host",
					"guest"
					)
				)
			),
			(
				.hotkeys[
					"libobs.hide_scene_item.GuestA",
					"libobs.hide_scene_item.GuestB",
					"libobs.hide_scene_item.GuestX",
					"libobs.show_scene_item.GuestA",
					"libobs.show_scene_item.GuestB",
					"libobs.show_scene_item.GuestX"
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
				"OBS_KEY_G",
				"OBS_KEY_H"
				)
		)
	)
)
|del(
	(
		.sources[] |
			(
				., .settings.items[]? | select(.name == (
					"Outro"
					)
				)
			),
			(
				.hotkeys[
					"libobs.hide_scene_item.Outro",
					"libobs.show_scene_item.Outro"
					]
			)
	),
	(
		.. | select(.key? == (
			"OBS_KEY_O"
			)
		)
	)
)
| (.sources[] | select(.name == "External").filters) |= [
	{
		"id": "color_filter",
		"name": "Color Correction",
		"settings": {
			"brightness": -0.15,
			"gamma": -0.15
		}
	}
] + .
| (.sources[] | select(.name == "External").filters[] | select(.id == "clut_filter").settings.clut_amount) = 0.35
| (.sources[] | select(.name == "External").settings) =
	{
		"device": "0x11120001bcf0215",
		"preset": "AVCaptureSessionPreset1920x1080"
	}
| (.sources[] | select(.name == "Internal").settings.device) = "EAB7A68FEC2B4487AADFD8A91C1CB782"
| (.sources[] | select(.name == "GuestA").settings.url) = "https://rtc.ninja/beta?optimize=0&r=verstaerker583je&scene&pull=GuestA"
| (.sources[] | select(.name == "Host").settings.url) = "https://rtc.ninja/beta?ad&aj&clean&bc&mvb=200&push=Host&r=verstaerker583je&vd=obs&wc"
| (.sources[] | select(.name == "Intro").settings.local_file) = "/Users/johanneserdmann/Documents/Segelsofa/intro.mp4"
