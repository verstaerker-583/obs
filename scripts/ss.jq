.name = "ss"
| del(
	(
		.sources[] |
			(
				select(.name == "Cam").hotkeys[
					"libobs.hide_scene_item.External"
					][] | select(.key == "OBS_KEY_I")
			)
	)
)
| (.sources[] | select(.id == "browser_source").settings|
	.css,
	.url
	) |= sub("gp";"ss")
| (.sources[] | select(.id == "color_source").settings.color) = 4294166577
| (.sources[] | select(.name == "?").settings.color1) = 4294166577
| (.sources[] | select(.name == "?").settings.color2) = 4294967295
| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "Overlay Chat").pos.y) = 510
| (.sources[] | select(.name == "Overlay Chat").settings.height) = 210
| (.sources[] | select(.name == "Cam").hotkeys[
	"libobs.show_scene_item.External"
	]) |= . + [{"key": "OBS_KEY_I"}]
