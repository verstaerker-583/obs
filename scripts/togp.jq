del(
	(
			.AuxAudioDevice2
	),
	(
		.sources[] |
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
| (.sources[] | select(.name == "External").settings.device) = "0x14200000046d0823"
| (.sources[] | select(.name == "Internal").settings.device) = "CC27327P54QGDV4AV"

| (.sources[] | select(.id == "browser_source").settings.url) |= sub("gp";"gp40")

| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/thomas"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/simone"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/lisa"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/martin"}]

| (.sources[] | select(.name == "Intro").settings.local_file) = "/Users/greenpeace/Documents/gp40/intro"
| (.sources[] | select(.name == "Outro").settings.local_file) = "/Users/greenpeace/Documents/gp40/outro"
| (.sources[] | select(.name == "Video").settings.local_file) = "/Users/greenpeace/Documents/gp40/video"
