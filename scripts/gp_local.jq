.name = "gp_local"
| del(
	(
		.sources[] |
			(select(.name == "cams").settings.items[] |select(.name == "External").rot),
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
	(
		.. | select(.enabled? == "false")
	)
)
| del(.sources[] | select(.name == "cams").settings.items[] |select(.name == "External").rot)
| (.AuxAudioDevice1.volume) = 2
| (.sources[] | select(.name == "cams").filters[] | select(.id == "mask_filter").settings.image_path) |= sub("camsMask";"camsMaskLocal")
| (.sources[] | select(.name == "cams").settings.items[] | select(.name == "External").bounds.x) = 352
| (.sources[] | select(.name == "cams").settings.items[] | select(.name == "External").pos.x) = 1094
