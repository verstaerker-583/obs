del(
	(
		.sources[] |
			(
				select(.name == "External").filters[] | select(.id == "sharpness_filter")
			)
	)
)
#| (.sources[] | select(.name == "External").settings.device) = "CC27327P54QGDV4AV"
| (.sources[] | select(.name == "External").filters[] | select(.id == "clut_filter").settings.clut_amount) = 0.5
| (.sources[] | select(.name == "External").filters[] | select(.id == "color_filter").settings.saturation) = 0.25
| (.sources[] | select(.name == "External").settings.device) = "0x14200000046d0823"
| (.sources[] | select(.name == "Internal").settings.device) = "CC27327P54QGDV4AV"
