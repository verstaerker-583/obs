del(
	(
		.sources[] |
			(
				., .settings.items[]? | select(.name == (
					"GuestA",
					"GuestB",
					"GuestX",
					"Host",
					"cam+",
					"guest",
					"guest+",
					"host"
					)
				)
			),
			(
				.hotkeys[
					"libobs.hide_scene_item.GuestA",
					"libobs.hide_scene_item.GuestB",
					"libobs.hide_scene_item.cam+",
					"libobs.show_scene_item.GuestA",
					"libobs.show_scene_item.GuestB",
					"libobs.show_scene_item.cam+"
					]
			)
	),
	(
		.. | select(
			.key? == (
				"OBS_KEY_F",
				"OBS_KEY_V",
				"OBS_KEY_B",
				"OBS_KEY_N",
				"OBS_KEY_X",
				"OBS_KEY_T",
				"OBS_KEY_Y",
				"OBS_KEY_G",
				"OBS_KEY_H"
				)
		)
	)
)

|del(
	(
		.sources[] |
			(
				., .settings.items[]? | select(.name == (
					"Outro"
					)
				)
			),
			(
				.hotkeys[
					"libobs.hide_scene_item.Outro",
					"libobs.show_scene_item.Outro"
					]
			)
	),
	(
		.. | select(.key? == (
			"OBS_KEY_O"
			)
		)
	)
)
| (.sources[] | select(.name == "External").filters) |= . + [{"id": "color_filter"}]
| (.sources[] | select(.name == "External").filters[] | select(.id == "color_filter").name) = "Color Correction" 
| (.sources[] | select(.name == "External").filters[] | select(.id == "color_filter").settings.enabled) = false
| (.sources[] | select(.name == "External").settings.device) = "0x11120001bcf0215"
| (.sources[] | select(.name == "External").settings.preset) = "AVCaptureSessionPreset1920x1080"
| (.sources[] | select(.name == "Internal").settings.device) = "EAB7A68FEC2B4487AADFD8A91C1CB782"
| (.sources[] | select(.name == "Intro").settings.local_file) = "/Users/johanneserdmann/Documents/Segelsofa/intro.mp4"

| (.sources[] | select(.name == "Host").settings.url) = "https://rtc.ninja/beta/?ad&aj&bc&mvb=200&vd=obs&wc&r=verstaerker583je&pull=director&push=host"
| (.sources[] | select(.name == "GuestA").settings.url) = "https://rtc.ninja/beta/?optimize=0&scene&r=verstaerker583je&pull=guestA"
| (.sources[] | select(.name == "GuestB").settings.url) = "https://rtc.ninja/beta/?optimize=0&scene&r=verstaerker583je&pull=guestB"
| (.sources[] | select(.name == "GuestX").settings.url) = "https://rtc.ninja/beta/?optimize=0&scene&r=verstaerker583je&pull=guestX"
