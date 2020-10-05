.name = "sr"

| (.sources[] | select(.id == "browser_source").settings.css) |= sub("gp";"sr")
| (.sources[] | select(.id == "browser_source").settings.url) |= sub("gp";"sr")
| (.sources[] | select(.id == "color_source").settings.color) = 4287868617
| (.sources[] | select(.name == "?").settings.color1) = 4287868617
| (.sources[] | select(.name == "?").settings.color2) = 4282145104
