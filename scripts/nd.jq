.name = "nd"

#| (.sources[] | select(.name == "?").settings.color1) = 4287868617
#| (.sources[] | select(.name == "?").settings.color2) = 4282145104
#| (.sources[] | select(.id == "color_source").settings.color) = 4287868617

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
		"libobs.show_scene_item.Overlay Start"
	]
)

| del(.. |
	select(.id? == "coreaudio_input_capture"),

#	select(.name? == "?"),
	select(.name? == "?").settings.color1,
	select(.name? == "?").settings.color2,
	select(.name? == "Background"),
	select(.name? == "Color Source"),
	select(.name? == "Intro"),
	select(.name? == "NDI"),
	select(.name? == "Outro"),

	select(.name? == "Finish"),
#	select(.name? == "Start"),
	select(.name? == "Start").settings,

	select(.name? | test("Overlay")?),
	select(.key? == "OBS_KEY_G"),
	select(.key? == "OBS_KEY_I")
)
