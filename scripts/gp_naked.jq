.name = "gp_naked"

| del(.. |
	select(.enabled? == "false"),
	select(.name? == "Background"),
	select(.name? == "Color Source"),
	select(.name? == "Slide Show"),
	select(.key? == "OBS_KEY_H")
)

| del(.sources[].hotkeys[
		"libobs.show_scene_item.Background",
		"libobs.show_scene_item.Color Source",
		"libobs.show_scene_item.Slide Show"
	]
)

| del(.sources[] | select(.name == "cams") |
	.settings.items[] | select(.name == "NDI"),
	.hotkeys[
		"libobs.hide_scene_item.NDI",
		"libobs.show_scene_item.NDI"
	]
)
