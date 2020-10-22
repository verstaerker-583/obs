.name = "ss"
| del(
	(
		.sources[] |
			(
				select(.name == "cams").hotkeys[
					"libobs.hide_scene_item.External",
					"libobs.show_scene_item.Internal"
				][] | select(.key == "OBS_KEY_3")
			),
			(select(.name == "cams").settings.items[] |select(.name == "External").rot),
			(
				., .settings.items[]? | select(
#					.name == "Color Source",
#					.name == "Slide Show"
					.name == "Screen Capture"
				)
			)
	),
	.DesktopAudioDevice1,
	(
		.. | select(.enabled? == "false")
	)
)
| (.sources[] | select(.name == "cams").filters[] | select(.id == "mask_filter").settings.image_path) |= sub("camsMask";"camsMaskLocal")
| (.sources[] | select(.name == "cams").settings.items[] | select(.name == "External").bounds.x) = 352
| (.sources[] | select(.name == "cams").settings.items[] | select(.name == "External").pos.x) = 1094

| (.sources[] | select(.id == "browser_source").settings|
	.css,
	.url
	) |= sub("gp";"ss")

| (.sources[] | select(.id == "color_source").settings.color) = 4294166577
| (.sources[] | select(.name == "?").settings.color1) = 4294166577
| (.sources[] | select(.name == "?").settings.color2) = 4294967295

| (.sources[] | select(.name == "cams").hotkeys[
	"libobs.hide_scene_item.Internal",
	"libobs.show_scene_item.External"
	]) |= . + [{"key": "OBS_KEY_3"}]
