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
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/01.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/02.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/03.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/04.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/05.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/06.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/07.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/08.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/09.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/10.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/11.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/12.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/13.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/14.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/15.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/16.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/17.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/18.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/19.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/20.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/21.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/22.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/23.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/24.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/25.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/26.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/27.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/28.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/29.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/30.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/31.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/32.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/33.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/34.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/35.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/36.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/37.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/38.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/39.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/40.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/41.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/42.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/43.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/44.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/45.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/46.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/47.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/48.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/49.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/50.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/51.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/52.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/53.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/54.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/55.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/56.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/57.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/58.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/59.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/60.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/61.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/62.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/63.png"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/64.png"}]

| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "https://i3.ytimg.com/vi/8ljL7-t_lUc/maxresdefault.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/65.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/66.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/67.jpg"}]

| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "https://i3.ytimg.com/vi/8ljL7-t_lUc/maxresdefault.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/68.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/69.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "/Users/greenpeace/Documents/gp40/pictures/70.jpg"}]

| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value": "https://i3.ytimg.com/vi/ePWpixWAanI/maxresdefault.jpg"}]
