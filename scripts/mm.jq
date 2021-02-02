#
.name = "mm"
| (.sources[] | select(.id == "browser_source").settings[]?|strings)|= sub("gp";"mm")
| (.sources[] | select(.name == "?").settings.color1) = 4278237947
| (.sources[] | select(.name == "?").settings.color2) = 4278227699
| (.sources[] | select(.name == "?").settings.font.face) = "American Typewriter"

# Simulator
| (.sources[] | select(.name == "GuestA").settings.css) = "body {background: yellow}"
| (.sources[] | select(.name == "GuestB").settings.css) = "body {background: red}"
| (.sources[] | select(.name == "GuestX").settings.css) = "body {background: orange}"
