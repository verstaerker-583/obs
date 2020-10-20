del(
	(
		.AuxAudioDevice2
	),
	(
		.sources[] |
			(
				select(.name == "Cam").hotkeys["libobs.hide_scene_item.screen"][] | select(.key == "OBS_KEY_NUM2")
			),
			(
				., .settings.items[]? | select(
					.name == "NDI",
					.name == "guest"
				)
			),
			(
				.hotkeys[
					"libobs.hide_scene_item.NDI",
					"libobs.hide_scene_item.guest",
					"libobs.show_scene_item.NDI",
					"libobs.show_scene_item.guest"
				]
			)
	),
	(
		.. | select(
			.key? == "OBS_KEY_F",
			.key? == "OBS_KEY_G",
			.key? == "OBS_KEY_H",
			.enabled? == "false"
			)
	)
)
| (.sources[] | select(.name == "Cam").hotkeys["libobs.show_scene_item.screen"]) |= . + [{"key": "OBS_KEY_NUM2"}]

#| (.sources[] | select(.name == "External").filters[] | select(.id == "clut_filter").settings.clut_amount) = 0.5
#| (.sources[] | select(.name == "External").settings.device) = "0x14200000046d0823"
| (.sources[] | select(.name == "External").settings.device) = "CC27327P54QGDV4AV"
| (.sources[] | select(.name == "Internal").settings.device) = "CC27327P54QGDV4AV"

| (.sources[] | select(.id == "browser_source").settings.url) |= sub("gp";"gp40")

| (.sources[] | select(.name == "Intro").settings.local_file) = "/Users/greenpeace/Documents/gp40/intro"
| (.sources[] | select(.name == "Outro").settings.local_file) = "/Users/greenpeace/Documents/gp40/outro"
| (.sources[] | select(.name == "Video").settings.local_file) = "/Users/greenpeace/Documents/gp40/video"

| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "https://i3.ytimg.com/vi/8ljL7-t_lUc/maxresdefault.jpg"}]
