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

| (.sources[] | select(.name == "Intro").settings.local_file) = "/Users/greenpeace/Documents/gp40/intro"
| (.sources[] | select(.name == "Outro").settings.local_file) = "/Users/greenpeace/Documents/gp40/outro"
| (.sources[] | select(.name == "Video").settings.local_file) = "/Users/greenpeace/Documents/gp40/video"

| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "https://i3.ytimg.com/vi/8ljL7-t_lUc/maxresdefault.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/thomas/01.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/thomas/02.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/thomas/03.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/thomas/04.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/thomas/05.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/thomas/06.jpg"}]

| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "https://i3.ytimg.com/vi/8ljL7-t_lUc/maxresdefault.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/simone/01.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/simone/02.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/simone/03.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/simone/04.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/simone/05.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/simone/06.jpg"}]

| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "https://i3.ytimg.com/vi/8ljL7-t_lUc/maxresdefault.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/lisa/01.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/lisa/02.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/lisa/03.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/lisa/04.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/lisa/05.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/lisa/06.jpg"}]

| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "https://i3.ytimg.com/vi/8ljL7-t_lUc/maxresdefault.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/martin/01.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/martin/02.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/martin/03.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/martin/04.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/martin/05.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/martin/06.jpg"}]

| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "https://i3.ytimg.com/vi/ePWpixWAanI/maxresdefault.jpg"}]

