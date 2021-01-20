.name = "mm"
| (.sources[] | select(.id == "browser_source").settings[]?|strings)|= sub("gp";"mm")
| (.sources[] | select(.name == "?").settings.color1) = 4278237947
| (.sources[] | select(.name == "?").settings.color2) = 4278227699
| (.sources[] | select(.name == "?").settings.font.face) = "American Typewriter"
