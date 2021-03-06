#
del(
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
					"guest",
					"host"
					)
				)
			),
			(
				.hotkeys[
					"libobs.hide_scene_item.GuestA",
					"libobs.hide_scene_item.GuestB",
					"libobs.hide_scene_item.GuestX",
					"libobs.hide_scene_item.Overlay Chat",
					"libobs.hide_scene_item.Overlay Donate",
					"libobs.hide_scene_item.Overlay Subscribe",
					"libobs.show_scene_item.GuestA",
					"libobs.show_scene_item.GuestB",
					"libobs.show_scene_item.GuestX",
					"libobs.show_scene_item.Overlay Chat",
					"libobs.show_scene_item.Overlay Donate",
					"libobs.show_scene_item.Overlay Subscribe"
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
	.DesktopAudioDevice1,
	(
		.sources[] |
			(
				select(.name == "Cam").hotkeys["libobs.hide_scene_item.display"][] | select(.key == (
					"OBS_KEY_2",
					"OBS_KEY_I"
					)
				)
			),
			(
				., .settings.items[]? | select(.name == (
					"?"
					)
				)
			),
#			(
#				select(.name == "External").filters[] | select(.id == "sharpness_filter")
#			),
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
				.hotkeys[
					"libobs.hide_scene_item.?",
					"libobs.show_scene_item.?"
					]
			)
	)
)
| (.sources[] | select(.id == "browser_source").settings[]?|strings)|= sub("gp";"gp40")
| (.sources[] | select(.name == "Cam").hotkeys["libobs.show_scene_item.display"]) |= . + [{"key": "OBS_KEY_2","key": "OBS_KEY_I"}]
#| (.sources[] | select(.name == "Cam").hotkeys["libobs.show_scene_item.display"]) |= . + [{"key": "OBS_KEY_I"}]
| (.sources[] | select(.name == "External").settings.device) = "CC24383EGBPF9T9CN"
| (.sources[] | select(.name == "Internal").settings.device) = "CC24383EGBPF9T9CN"
| (.sources[] | select(.name == "Intro").settings.local_file) = "/Users/greenpeace/Documents/gp40/intro"
| (.sources[] | select(.name == "Outro").settings.local_file) = "/Users/greenpeace/Documents/gp40/outro"
