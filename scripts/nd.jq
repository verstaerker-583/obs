.name = "nd"

| del(
	.sources[].hotkeys[
#		"libobs.hide_scene_item.?",
		"libobs.hide_scene_item.Intro",
		"libobs.hide_scene_item.NDI",
		"libobs.hide_scene_item.Overlay Chat",
		"libobs.hide_scene_item.Overlay Donate",
#		"libobs.show_scene_item.?",
		"libobs.show_scene_item.Background",
		"libobs.show_scene_item.Color Source",
		"libobs.show_scene_item.Intro",
		"libobs.show_scene_item.NDI",
		"libobs.show_scene_item.Overlay Cam",
		"libobs.show_scene_item.Overlay Chat",
		"libobs.show_scene_item.Overlay Donate",
		"libobs.show_scene_item.Overlay Start",
		"libobs.hide_scene_item.guest",
		"libobs.show_scene_item.guest"
	]
)

| del(.. |
	select(.name? == "?").settings.color1,
	select(.name? == "?").settings.color2,
	select(.name? == "Start").settings,
	select(.name? | test("Overlay")?),

	select(
		.id? == "coreaudio_input_capture",
#		.name? == "?",
		.name? == "Background",
		.name? == "Color Source",
		.name? == "Finish",
		.name? == "Intro",
		.name? == "NDI",
		.name? == "Outro",
#		.name? == "Start",
		.name? == "guest",
		.key? == "OBS_KEY_F",
		.key? == "OBS_KEY_G",
		.key? == "OBS_KEY_H",
		.key? == "OBS_KEY_I"
	)
)
