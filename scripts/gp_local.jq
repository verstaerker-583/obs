.name = "gp_local"
| del(
	(
		.sources[] |
			(
				select(.name == "cams").hotkeys[
					"libobs.hide_scene_item.Internal",
					"libobs.show_scene_item.External"
					][] | select(.key == "OBS_KEY_3")
			)
	)
)
| (.sources[] | select(.name == "cams").filters[] | select(.id == "mask_filter").settings.image_path) |= sub("camsMask";"camsMaskLocal")
| (.sources[] | select(.name == "cams").hotkeys[
	"libobs.hide_scene_item.External",
	"libobs.show_scene_item.Internal"
	]) |= . + [{"key": "OBS_KEY_3"}]
| (.sources[] | select(.name == "cams").settings.items[] | select(.name == "External").bounds.x) = 352
| (.sources[] | select(.name == "cams").settings.items[] | select(.name == "External").pos.x) = 1094
