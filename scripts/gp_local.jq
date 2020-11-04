.name = "gp_local"
| del(
#	.DesktopAudioDevice1,
	(
		.sources[] |
			(
				select(.name == "Cam").hotkeys[
					"libobs.hide_scene_item.External",
					"libobs.hide_scene_item.screen"
					][] | select(.key == "OBS_KEY_NUM2")
			),
			(
				select(.name == "cams").hotkeys[
					"libobs.hide_scene_item.Internal",
					"libobs.show_scene_item.External"
					][] | select(.key == "OBS_KEY_3")
			),
			(
				select(.name == "cams").settings.items[] |select(.name == "External").rot
			),
			(
				., .settings.items[]? | select(.name == (
					"Color Source",
					"Slide Show"
#					"Screen Capture"
					)
				)
			)
	),
	(
		.. | select(.enabled? == "false")
	)
)
| (.sources[] | select(.name == "Cam").hotkeys["libobs.show_scene_item.External"]) |= . + [{"key": "OBS_KEY_NUM2"}]
| (.sources[] | select(.name == "Cam").hotkeys["libobs.show_scene_item.screen"]) |= . + [{"key": "OBS_KEY_NUM2"}]
| (.sources[] | select(.name == "cams").filters[] | select(.id == "mask_filter").settings.image_path) |= sub("camsMask";"camsMaskLocal")
| (.sources[] | select(.name == "cams").hotkeys[
	"libobs.hide_scene_item.External",
	"libobs.show_scene_item.Internal"
	]) |= . + [{"key": "OBS_KEY_3"}]
| (.sources[] | select(.name == "cams").settings.items[] | select(.name == "External").bounds.x) = 352
| (.sources[] | select(.name == "cams").settings.items[] | select(.name == "External").pos.x) = 1094
