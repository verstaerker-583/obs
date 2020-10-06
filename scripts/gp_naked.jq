.name = "gp_naked"

| del(.. |
	select(
		.enabled? == "false",
		.name? == "Color Source",
		.name? == "Slide Show"
	)
)

| del(.sources[].hotkeys[
		"libobs.show_scene_item.Color Source",
		"libobs.show_scene_item.Slide Show"
	]
)
