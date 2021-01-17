del(
	(
		.sources[] |
			(
				select(.name == "External").filters[] | select(.id == "sharpness_filter")
			)
	)
)

| (.sources[] | select(.id == "display_capture").settings.display) = 0 
#| (.sources[] | select(.name == "External").filters[] | select(.id == "clut_filter").settings.clut_amount) = 0.5
#| (.sources[] | select(.name == "External").settings.device) = "0x14100000046d0823"
| (.sources[] | select(.name == "External").settings.device) = "CC27327P54QGDV4AV"
| (.sources[] | select(.name == "Internal").settings.device) = "CC27327P54QGDV4AV"
