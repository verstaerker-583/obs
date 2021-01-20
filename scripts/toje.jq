del(
	(
		.sources[] |
			(
				., .settings.items[]? | select(.name == (
#					"Guest",
					"Outro"
#					"guest"
					)
				)
			),
			(
				.hotkeys[
#					"libobs.hide_scene_item.Guest",
					"libobs.hide_scene_item.Outro",
#					"libobs.hide_scene_item.guest",
#					"libobs.show_scene_item.Guest",
					"libobs.show_scene_item.Outro"
#					"libobs.show_scene_item.guest"
					]
			)
#	),
#	(
#		.. | select(.key? == (
#			"OBS_KEY_F",
#			"OBS_KEY_G",
#			"OBS_KEY_H",
#			"OBS_KEY_O"
#			)
#		)
	)
)
| (.sources[] | select(.name == "External").filters) |= . + [{"id": "color_filter"}]
| (.sources[] | select(.name == "External").filters[] | select(.id == "color_filter").name) = "Color Correction" 
| (.sources[] | select(.name == "External").filters[] | select(.id == "color_filter").settings.enabled) = false
| (.sources[] | select(.name == "External").settings.device) = "0x11120001bcf0215"
| (.sources[] | select(.name == "Internal").settings.device) = "EAB7A68FEC2B4487AADFD8A91C1CB782"
| (.sources[] | select(.name == "Intro").settings.local_file) = "/Users/johanneserdmann/Desktop/intro.mp4"
| (.sources[] | select(.name == "Guest").settings.url) = "https://rtc.ninja/beta/?na&optimize=0&scene&r=verstaerker583&pull=guest"
| (.sources[] | select(.name == "Send").settings.url) = "https://rtc.ninja/beta/?ad&aj&bc&wc&vd=obs&r=verstaerker583&push=host"
