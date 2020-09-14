.name = "gp_naked"

| del(.. |
	select(.enabled? == "false"),

	select(.name? == "Background"),
	select(.name? == "Color Source"),
	select(.name? == "Slide Show")
)

| del(.sources[].hotkeys[
		"libobs.show_scene_item.Background",
		"libobs.show_scene_item.Color Source",
		"libobs.show_scene_item.Slide Show"
	]
)
