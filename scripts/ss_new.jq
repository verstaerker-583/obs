.name = "ss"
| (.sources[] | select(.id == "browser_source").settings[]|strings)|= sub("gp";"ss")
| (.sources[] | select(.name == "?").settings.color1) = 4291932451
| (.sources[] | select(.name == "?").settings.color2) = 4294967295
| (.sources[] | select(.name == "?").settings.font.face) = "Comic Sans MS"
| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "?").pos.y) = 320
| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "Overlay Chat").pos.y) = 510
| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "screen").bounds.x) = 432 
| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "screen").bounds.y) = 243 
| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "screen").pos.x) = 1030
| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "screen").pos.x) = 1054
| (.sources[] | select(.name == "Overlay Chat").settings.height) = 210
| (.sources[] | select(.name == "Overlay Chat").settings.width) = 750
