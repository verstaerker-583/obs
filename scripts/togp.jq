del(
	(
		.sources[] |
			(
				select(.id == "ffmpeg_source").settings,
				select(.id == "slideshow").settings.files
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
| (.sources[] | select(.id == "ffmpeg").settings.close_when_inactive) = true

#| (.sources[] | select(.name == "External").settings.device) = "0x14200000046d0823"
#| (.sources[] | select(.name == "Internal").settings.device) = "0x8020000005ac8514"

| (.sources[] | select(.id == "browser_source").settings.url) |= sub("gp";"gp40")

| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "https://www.greenpeace.de/sites/www.greenpeace.de/files/styles/galleria_desk_1x/public/atom_unterweser.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "https://www.greenpeace.de/sites/www.greenpeace.de/files/styles/galleria_desk_1x/public/brent_spar_1.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "https://www.greenpeace.de/sites/www.greenpeace.de/files/styles/galleria_desk_1x/public/gp02oc1.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "https://www.greenpeace.de/sites/www.greenpeace.de/files/styles/galleria_desk_1x/public/gp030rj_medium_res_walfang.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "https://www.greenpeace.de/sites/www.greenpeace.de/files/styles/galleria_desk_1x/public/gp0stoc2o_medium_res.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "https://www.greenpeace.de/sites/www.greenpeace.de/files/styles/galleria_desk_1x/public/nuclear_free_seas.jpg"}]

| (.sources[] | select(.name == "Intro").settings.local_file) = "/Users/greenpeace/Documents/gp40/intro"
| (.sources[] | select(.name == "Outro").settings.local_file) = "/Users/greenpeace/Documents/gp40/outro"
| (.sources[] | select(.name == "Video").settings.local_file) = "/Users/greenpeace/Documents/gp40/video"
