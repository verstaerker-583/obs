.name = "bd_naked"
| del(
	(
		.sources[] |
			(select(.name == "NDI").filters[] | select(.id != "mask_filter")),
			(
				., .settings.items[]? | select(
#					.name == "Color Source",
#					.name == "Slide Show"
					.name == "Screen Capture"
				)
			),
			(
				.hotkeys[
#					"libobs.show_scene_item.Color Source",
#					"libobs.show_scene_item.Slide Show"
					"libobs.show_scene_item.Screen Capture"
				]
			)
	),
	.DesktopAudioDevice1,
	(.AuxAudioDevice2.filters[] | select(.id != "limiter_filter")),
	(
		.. | select(
			.key? == "OBS_KEY_G",
			.key? == "OBS_KEY_M",
			.enabled? == "false"
			)
	)
)
