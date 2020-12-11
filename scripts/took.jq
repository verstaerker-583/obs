del(
	(
		.sources[] |
			(
				select(.name == "External").filters[] | select(.id == "sharpness_filter")
			),
			(
				., .settings.items[]? | select(
#					(.name | test("Overlay")),
					.name == (
						"Color Source",
						"Slide Show"
#						"Screen Capture"
					)
				)
#			),
#			(
#				.hotkeys[
#					"libobs.hide_scene_item.Overlay Chat",
#					"libobs.hide_scene_item.Overlay Donate",
#					"libobs.show_scene_item.Overlay Cam",
#					"libobs.show_scene_item.Overlay Chat",
#					"libobs.show_scene_item.Overlay Donate"
#					]
			)
	)
)

#| (.sources[] | select(.name == "External").filters[] | select(.id == "clut_filter").settings.clut_amount) = 0.5
#| (.sources[] | select(.name == "External").settings.device) = "0x14200000046d0823"
| (.sources[] | select(.id == "display_capture").settings.display) = 0 
| (.sources[] | select(.name == "External").settings.device) = "CC27327P54QGDV4AV"
| (.sources[] | select(.name == "Internal").settings.device) = "CC27327P54QGDV4AV"

| del(..|.monitoring_type?)
