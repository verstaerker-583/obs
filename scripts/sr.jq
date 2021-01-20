.name = "sr"
| (.sources[] | select(.id == "browser_source").settings[]?|strings)|= sub("gp";"sr")
| (.sources[] | select(.name == "?").settings.color1) = 4287868617
| (.sources[] | select(.name == "?").settings.color2) = 4282145104
