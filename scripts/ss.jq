.name = "ss"
| (.sources[] | select(.id == "browser_source").settings|
	.css,
	.url
	) |= sub("gp";"ss")
| (.sources[] | select(.id == "color_source").settings.color) = 4294166577
| (.sources[] | select(.name == "?").settings.color1) = 4294166577
| (.sources[] | select(.name == "?").settings.color2) = 4294967295
