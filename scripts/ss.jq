.name = "ss"
| (.sources[] | select(.id == "browser_source").settings[]?|strings)|= sub("gp";"ss")
| (.sources[] | select(.name == "?").settings.color1) = 4291932451
| (.sources[] | select(.name == "?").settings.color2) = 4294967295
| (.sources[] | select(.name == "?").settings.font.face) = "Comic Sans MS"
| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "display").bounds.x) = 432 
| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "display").bounds.y) = 243 
| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "display").pos.x) = 1054
