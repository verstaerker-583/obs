if .name == "gp_naked" then
	del(
		.DesktopAudioDevice1,
		(
			.sources[] |
				(
					., .settings.items[]? | select(.name == (
						"?"
						)
					)
				),
				(
					.hotkeys[
						"libobs.hide_scene_item.?",
						"libobs.show_scene_item.?"
						]
				)
		)
	)
elif .name == "gp_local" then
	del(
		.AuxAudioDevice2,
		(
			.sources[] |
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
	| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "screen").pos.y) = 475
elif .name == "bd" then
	del(
		(
			.AuxAudioDevice2.filters[] | select(.id != "limiter_filter")
		),
		(
			.sources[] |
				(
					select(.name == "NDI").filters[] | select(.id != "mask_filter")
				)
		),
		(
			.. | select(
				.enabled? == "false",
				.key? == (
					"OBS_KEY_D",
					"OBS_KEY_G",
					"OBS_KEY_M"
					)
			)
		)
	)
else
	.
end

| del(
	(
		.sources[] |
			(
				., .settings.items[]? | select(.name == (
					"Overlay Chat",
					"Video",
					"Color Source",
					"Slide Show"
#					"Screen Capture"
					)
				)
			),
			(
				.hotkeys[
					"libobs.hide_scene_item.Overlay Chat",
					"libobs.hide_scene_item.Video",
					"libobs.show_scene_item.Overlay Chat",
					"libobs.show_scene_item.Video"
					]
			)
	),
	(
		.. | select(.key? == (
			"OBS_KEY_V"
			)
		)
	)
)
| (.sources[] | select(.name == "External").settings.device) = "0x2543000043e9a4d"
| (.sources[] | select(.name == "Internal").settings.device) = "0x8020000005ac8514"
| (.sources[] | select(.name == "Intro").settings.local_file) = "/Users/markus/Documents/DieWeltImBlick/intro"
| (.sources[] | select(.name == "Outro").settings.local_file) = "/Users/markus/Documents/DieWeltImBlick/outro"
| (.sources[] | select(.name == "Video").settings.local_file) = "/Users/markus/Documents/DieWeltImBlick/video"
