del(
	(
		.sources[] |
			(
				., .settings.items[]? | select(
					.name == "NDI",
					.name == "Outro",
					.name == "Video"
				)
			),
			(
				.hotkeys[
					"libobs.hide_scene_item.NDI",
					"libobs.hide_scene_item.Outro",
					"libobs.hide_scene_item.Video",
					"libobs.show_scene_item.NDI",
					"libobs.show_scene_item.Outro",
					"libobs.show_scene_item.Video"
				]
			)
	),
	(
		.. | select(
			.key? == "OBS_KEY_F",
			.key? == "OBS_KEY_H",
			.key? == "OBS_KEY_O",
			.key? == "OBS_KEY_V",
			.enabled? == "false"
			)
	)
)
| (.sources[] | select(.name == "External").settings.device) = "CC27327P54QGDV4AV"
| (.sources[] | select(.name == "Internal").settings.device) = "CC27327P54QGDV4AV"
| (.sources[] | select(.name == "cams").settings.items[] | select(.name == "Internal").crop_left) = 640

# demo
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.johannes-erdmann.com/wordpress/wp-content/uploads/2020/07/IMG_6702-1-401x534.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.johannes-erdmann.com/wordpress/wp-content/uploads/2020/07/IMG_6910-1-712x534.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.johannes-erdmann.com/wordpress/wp-content/uploads/2020/07/mizar1-Kopie.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.johannes-erdmann.com/wordpress/wp-content/uploads/2020/07/mizar2-Kopie-1-800x534.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.johannes-erdmann.com/wordpress/wp-content/uploads/2020/08/07_08_07_dover-005-712x534.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.johannes-erdmann.com/wordpress/wp-content/uploads/2020/08/0a1c846e5d48c9363997cadf617993d216d23830.jpg"}]
| (.sources[] | select(.id == "slideshow").settings.files) |= . + [{"value":"https://www.johannes-erdmann.com/wordpress/wp-content/uploads/2020/08/Ohne-Titel-1.jpg"}]
| (.sources[] | select(.name == "Intro").settings.input) = "https://images-assets.nasa.gov/video/Jack%20Kings%20Apollo%2011%20Launch%20Commentary/Jack%20Kings%20Apollo%2011%20Launch%20Commentary~orig.mp4"
| (.sources[] | select(.name == "Intro").settings.is_local_file) = false
