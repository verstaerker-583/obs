.name = "sr"
| (.sources[] | select(.id == "browser_source").settings|
	.css,
	.url
	) |= sub("gp";"sr")
| (.sources[] | select(.name == "?").settings.color1) = 4287868617
| (.sources[] | select(.name == "?").settings.color2) = 4282145104
| (.sources[] | select(.name == "Overlay Chat").settings.width) = 560
