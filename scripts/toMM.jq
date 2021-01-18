if .name == "bd" then
	del(
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
elif .name == "gp" then
	del(
		(
			.sources[] |
				(
					., .settings.items[]? | select(.name == (
						"?",
						"Guest",
						"guest"
						)
					)
				),
				(
					.hotkeys[
						"libobs.hide_scene_item.?",
						"libobs.hide_scene_item.Guest",
						"libobs.hide_scene_item.guest",
						"libobs.show_scene_item.?",
						"libobs.show_scene_item.Guest",
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
	| (.sources[] | select(.name == "Intro").settings.local_file) = "/Users/markus/Documents/DieWeltImBlick/intro"
	| (.sources[] | select(.name == "Outro").settings.local_file) = "/Users/markus/Documents/DieWeltImBlick/outro"
else
	.
end

| del(
	(
		.sources[] |
			(
				., .settings.items[]? | select(.name == (
					"Overlay Chat"
					)
				)
			),
			(
				.hotkeys[
					"libobs.hide_scene_item.Overlay Chat",
					"libobs.show_scene_item.Overlay Chat"
					]
			)
	)
)
#| (.sources[] | select(.name == "External").settings.device) = "0x2543000043e9a4d"
| (.sources[] | select(.name == "External").settings.device) = "0x2543000043e9a4d"
| (.sources[] | select(.name == "Internal").settings.device) = "0x8020000005ac8514"
