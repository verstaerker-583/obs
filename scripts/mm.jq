.name = "mm"
| (.sources[] | select(.id == "browser_source").settings[]|strings)|= sub("gp";"mm")
| (.sources[] | select(.name == "?").settings.color1) = 4278237694
| (.sources[] | select(.name == "?").settings.color2) = 4278227699
| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "Overlay Chat").pos.x) = 240 
| (.sources[] | select(.name == "Cam").settings.items[] | select(.name == "Overlay Chat").pos.y) = 586 
| (.sources[] | select(.name == "Overlay Chat").settings.height) = 124
| (.sources[] | select(.name == "Overlay Chat").settings.width) = 800
