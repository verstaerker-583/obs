del(
	.AuxAudioDevice2,
	.DesktopAudioDevice1,
	(
		.sources[] |
			(
				select(.name == "External").filters[] | select(.id == "sharpness_filter")
			),
			(
				select(.name == "Cam").settings.items[] | select(.name == "External")
			),
			(
				select(.name == "Cam").hotkeys[
					"libobs.hide_scene_item.External",
					"libobs.show_scene_item.External"
					]
			),
			(
				., .settings.items[]? | select(.name == (
					"NDI",
					"guest"
					)
				)
			),
			(
				.hotkeys[
					"libobs.hide_scene_item.NDI",
					"libobs.hide_scene_item.guest",
					"libobs.show_scene_item.NDI",
					"libobs.show_scene_item.guest"
					]
			)
	),
	(
		.. | select(.key? == (
			"OBS_KEY_F",
			"OBS_KEY_G",
			"OBS_KEY_H"
			)
		)
	)
)
| (.AuxAudioDevice1.settings.device_id) = "AppleHDAEngineInput:1B,0,1,0:1"
| (.sources[] | select(.id == "browser_source").settings.url) |= sub("gp";"gp40")
#| (.sources[] | select(.name == "External").filters[] | select(.id == "clut_filter").settings.clut_amount) = 0.5
#| (.sources[] | select(.name == "External").filters[] | select(.id == "color_filter").settings.saturation) = 0.25
#| (.sources[] | select(.name == "External").settings.device) = "0x14200000046d0823"
| (.sources[] | select(.name == "External").settings.device) = "CC24383EGBPF9T9CN"
| (.sources[] | select(.name == "Internal").settings.device) = "CC24383EGBPF9T9CN"
| (.sources[] | select(.name == "Intro").settings.local_file) = "/Users/greenpeace/Documents/gp40/intro"
| (.sources[] | select(.name == "Outro").settings.local_file) = "/Users/greenpeace/Documents/gp40/outro"
| (.sources[] | select(.name == "Video").settings.local_file) = "/Users/greenpeace/Documents/gp40/video"
